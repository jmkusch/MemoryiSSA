#' @title Predict H1 season fusion
#' @export
#' @author Jillian Kusch
predict_h1_fusion_short_term_by_year <- function(DT, models) {
  N <- 100L
  
  setDT(DT)
  predictions <- lapply(models, function(model_, DT)   {
    year <- model_[[1]]
    model <- model_[[2]]
    DT <- DT[yr == year]
    new_data <- DT[, .(
      indiv_step_id = NA ,
      yr = NA,
      prop_forest = mean(prop_forest, na.rm = TRUE),
      memory_short_term = mean(memory_short_term, na.rm = TRUE),
      distancetofusion_short_term = seq(from = min(distancetofusion_short_term), to = max(distancetofusion_short_term), length.out = N),
      nitrogen_memory_short_term = mean(nitrogen_memory_short_term, na.rm = TRUE)


    ), by = id]
    
    new_data[, h1_fusion_short_term := predict(model, .SD, type = 'link', re.form = NULL)]
    
    new_data[, x := seq(from = min(distancetofusion_short_term), to = max(distancetofusion_short_term), length.out = N), by = id]
    
    return(list(year,new_data))
  },DT)
  return(predictions)
}

