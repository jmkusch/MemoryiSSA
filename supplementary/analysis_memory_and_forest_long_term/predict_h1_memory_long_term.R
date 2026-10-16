#' @title Predict H1 season memory
#' @export
#' @author Jillian Kusch
predict_h1_memory_long_term <- function(DT, model) {
  N <- 100L
  
  setDT(DT)

  new_data <- DT[, .(
    indiv_step_id = NA ,
    yr = NA,
    prop_forest = mean(prop_forest, na.rm = TRUE),
    memory_long_term = seq(from = min(memory_long_term), to = max(memory_long_term), length.out = N),

  ), by = id]
  
  new_data[, h1_memory_long_term := predict(model, .SD, type = 'link', re.form = NULL)]
  
  new_data[, x := seq(from = min(memory_long_term), to = max(memory_long_term), length.out = N), by = id]
}
