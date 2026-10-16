# === Targets: Fogo Memory ----------------------
# Jillian M. Kusch

# Source ------------------------------------------------------------------
targets::tar_source('R')

# Options -----------------------------------------------------------------
tar_option_set(packages = c("data.table", "qs", "targets", "tarchetypes", "parallel", "visNetwork", "renv","lme4", "amt", "ggthemes", "distanceto", "glmmTMB"),
               format = 'qs')
# Data --------------------------------------------------------------------
# Path to land cover rasters
# lc = Canadian Forest service, sdss = provincial product
sdss_path <- file.path('input', 'sdss.tif')
sdss_legend_path <- file.path('input', 'legend_sdss.csv')

# Stoich layer paths
lichen_path <- file.path('input', 'Cladonia_N.tif')

# Caribou data path
gps_path <- file.path('input', 'all_Fogo_caribou_locs_20June2025.csv')
id_path <- file.path('input', 'collar-animal-ids.csv')

# Variables ---------------------------------------------------------------
bb <- c(
  xmin = -54.3533,
  ymin = 49.5194,
  xmax = -53.954220,
  ymax = 49.763834
)
epsg <- 32621
crs <- st_crs(epsg)
crs_sp <- CRS(crs$wkt)


id_col <- 'Animal_ID'
datetime_col <- 'datetime'
x_col <- 'x_long'
y_col <- 'y_lat'
tz <- 'America/St_Johns'

# Split by: within which column or set of columns (eg. c(id, yr))
#  do we want to split our analysis?
split_by <- id_col
seasonal_split <- "season"

# For iSSA tracks:
# Resampling rate
rate <- minutes(120)
# Tolerance
tolerance <- minutes(5)
# Number of random steps
n_random_steps <- 10

#for memory building
time_frame = 14
grid_size = 200
blurring_range = 500

# Targets: data -----------------------------------------------------------
targets_data <- c(
  
   tar_file_read(
    caribou,
    gps_path,
    fread(!!.x)
  ),
  tar_file_read(
    ids,
    id_path,
    fread(!!.x)
  ),
 
  tar_file_read(
    sdss,
    sdss_path,
    raster(!!.x)
  ),
  tar_file_read(
    sdss_legend,
    sdss_legend_path,
    fread(!!.x)
  ),
  
  tar_file_read(
    lichen,
    lichen_path,
    raster(!!.x)
  )
 
)


# Targets: preparing caribou data ---------------------------
targets_prep <- c(
  
  tar_target(
    tidy_GPS,
    GPS_tidying(caribou, ids)
  ),
  tar_target(
    locs_prep,
    prepare_locs(tidy_GPS, id_col, datetime_col, tz, x_col, y_col, split_by),
    iteration = 'group'
  ),
  tar_target(
    split_key,
    unique(locs_prep[, .SD, .SDcols = c(split_by, 'tar_group')])
  )
  
)


# Targets: tracks ---------------------------------------------------------
targets_tracks <- c(
  tar_target(
    tracks,
    make_track(locs_prep, x_, y_, t_, all_cols = TRUE, crs = 4326) |>
      transform_coords(crs_to = crs),
    pattern = map(locs_prep)
  ),
  tar_target(
    tracks_resampled,
    resample_tracks(tracks, rate = rate, tolerance = tolerance),
    pattern = map(tracks)
  ),
  tar_target(
    tracks_random,
    random_steps(tracks_resampled, n_control = n_random_steps),
    pattern = map(tracks_resampled)
  )
)

## Extracting data for tracks ------------------------------

targets_extract <- c(
  
  tar_target(
    tracks_random_cleaned,
    remove_NA_steps(tracks_random)
  ),

  tar_target(
    memory_short_term,
    extract_memory_short_term(
      tracks_resampled, 
      tracks_random_cleaned,
      time_frame, # number of days
      grid_size,
      blurring_range
    )
  ),
  
  tar_target(
    memory_long_term,
    extract_memory_long_term(
      tracks_resampled,
      memory_short_term
      )
  ),
  
  tar_target(
    fusion_long_term,
    extract_fusion_long_term(
      tracks_resampled, 
      memory_long_term
    )
  ),

  tar_target(
    fusion_short_term,
    extract_fusion_short_term(
      tracks_resampled, 
      fusion_long_term,
      time_frame
    )
  ), 
  
  tar_target(
    nitrogen_short_memory,
    extract_nitrogen_memory_short_term(
      fusion_short_term, 
      lichen,
      time_frame, 
      grid_size,
      blurring_range
      
    )
  ), 

  tar_target(
    nitrogen_long_memory,
    extract_nitrogen_memory_long_term(
      nitrogen_short_memory, 
      lichen
    )
  ), 
  
  # SDSS call
  tar_target(
    tracks_extract,
    extract_layers(
      nitrogen_long_memory,
      crs,
      sdss,
      sdss_legend
    )
  ),

  
  tar_target(
    tracks_lc,
    extract_forest(
      tracks_extract,
      crs,
      sdss,
      3
    )
  )  
)

# Targets: distributions --------------------------------------------------
targets_distributions <- c(
  tar_target(
    dist_parameters,
    calc_distribution_parameters(tracks_random),
    pattern = map(tracks_random)
  )
)

# Targets: seasonal models ----------------------------------------------------------
targets_winter <- c(
  tar_target(
    season_prep,
    prepare_season(tracks_lc)
  ),

  tar_target(
    winter_prep,
    prepare_model(season_prep, "winter")
  ),

  ## Le Goff and Peignier both call winter 1 Jan - 16 March

  tar_target(
    winter_model,
    memory_model_long_term(winter_prep)
  ),
  
  
    tar_target(
      winter_model_check,
      model_check(winter_model)
  )
)



# Targets: model output and effects ------------------------------------------------------------
targets_seasonal_effects <- c(
  tar_target(
    indiv_winter,
    indiv_estimates(winter_model)
  ),

  tar_target(
    pop_winter,
    population_mean_estimates(indiv_winter, "winter")
  ),

  tar_target(
    winter_boxplot,
    plot_box_horiz(indiv_winter, plot_theme())
  ),

  tar_target(
    sum_winter,
    sum_plot(indiv_winter, "winter")
  )
  
)

# Targets: RSS from winter model -----------------------------------------------------------
 targets_rss_winter <- c(
   
  tar_target(
   pred_h1_memory_long_term_w,
    predict_h1_memory_long_term(winter_prep, winter_model)
  ),
  
   tar_target(
     pred_h1_forest_long_term_w,
     predict_h1_forest_long_term(winter_prep, winter_model)
   ),

   tar_target(
     pred_h2_long_term_w,
     predict_h2_long_term(winter_prep, winter_model)
   ),

  
   tar_target(
     rss_forest_long_term_w,
     calc_rss(pred_h1_forest_long_term_w, 'h1_forest_long_term', pred_h2_long_term_w, 'h2_long_term')
   ),

  tar_target(
    rss_memory_long_term_w,
   calc_rss(pred_h1_memory_long_term_w, 'h1_memory_long_term', pred_h2_long_term_w, 'h2_long_term')
  ),

  
 tar_target(
   plot_rss_forest_long_term_w,
   plot_rss(rss_forest_long_term_w, plot_theme()) +
     labs(x = 'Proportion forested (100m)', y = 'logRSS',
          title = "A")
 ),
 
 
 tar_target(
   plot_rss_memory_long_term_w,
   plot_rss(rss_memory_long_term_w, plot_theme()) +
     # Density of spatial recent temporal memory
     labs(x = 'Memory of geographic space', y = 'logRSS',
          title = "B")
 ),
 

 tar_target(
   winter_rss_plots,
   save_rss_plot("rss_long_term_forest_and_memory_winter",
                 plot_rss_forest_long_term_w, 
                 plot_rss_memory_long_term_w
                 
   )
)




# Targets: all ------------------------------------------------------------
# Automatically grab and combine all the "targets_*" lists above
lapply(grep('targets', ls(), value = TRUE), get)
