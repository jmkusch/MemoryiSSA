#' @title Predict H2
#' @export
#' @author Jack G Hendrix, , Jillian M. Kusch
predict_h2_short_term_by_year <- function(DT, models) {
  
  setDT(DT)
  predictions <- lapply(models, function(model_, DT)   {
    year <- model_[[1]]
    model <- model_[[2]]
    DT <- DT[yr == year]
    new_data <- DT[, .(
      
      indiv_step_id = NA,
      yr = NA,

      prop_forest = mean(prop_forest, na.rm = TRUE),
      memory_short_term = mean(memory_short_term, na.rm = TRUE),
      distancetofusion_short_term = mean(distancetofusion_short_term, na.rm = TRUE),
      nitrogen_memory_short_term = mean(nitrogen_memory_short_term, na.rm = TRUE)
      
    ), by = id]
    
    new_data[, h2_short_term := predict(model, .SD, type = 'link', re.form = NULL)]
    
    return(list(year,new_data))
  },DT)
  return(predictions)
}
