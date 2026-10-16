#' @title Predict H2
#' @export
#' @author Jillian M. Kusch
predict_h2_long_term_by_year <- function(DT, models) {
  
  setDT(DT)
  predictions <- lapply(models, function(model_, DT)   {
    year <- model_[[1]]
    model <- model_[[2]]
    DT <- DT[yr == year]
    new_data <- DT[, .(
      indiv_step_id = NA,
      yr = NA,
      prop_forest = mean(prop_forest, na.rm = TRUE),
      memory_long_term = mean(memory_long_term, na.rm = TRUE),
      distancetofusion_long_term = mean(distancetofusion_long_term, na.rm = TRUE),
      nitrogen_memory_long_term = mean(nitrogen_memory_long_term, na.rm = TRUE)
      
    ), by = id]
    
    new_data[, h2_long_term := predict(model, .SD, type = 'link', re.form = NULL)]
    
    return(list(year,new_data))
  },DT)
return(predictions)
}
