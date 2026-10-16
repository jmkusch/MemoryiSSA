#' @title Predict H1 long term forest
#' @export
#' @author Jillian M. Kusch
predict_h1_forest_long_term_by_year <- function(DT, models) {
	N <- 100L

	setDT(DT)
	predictions <- lapply(models, function(model_, DT)   {
	  year <- model_[[1]]
	  model <- model_[[2]]
	  DT <- DT[yr == year]
  	new_data <- DT[, .(
  	  indiv_step_id = NA ,
  	  yr = NA,
  	  prop_forest = seq(from = 0, to = 1, length.out = N),
  	  season_memory = mean(season_memory, na.rm = TRUE),
  	  distancetofusion = mean(distancetofusion, na.rm = TRUE),
  	  long_term_nitrogen_memory = mean(long_term_nitrogen_memory, na.rm = TRUE)
  	  
  	), by = id]
  	
  	new_data[, h1_forest_long_term := predict(model, .SD, type = 'link', re.form = NULL)]
  	
  	new_data[, x := seq(from = 0, to = 1, length.out = N), by = id]
  	
  	return(list(year,new_data))
	},DT)
	return(predictions)
}
