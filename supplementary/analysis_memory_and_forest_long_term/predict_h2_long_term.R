#' @title Predict H2
#' @export
#' @author Jillian M. Kusch
predict_h2_long_term <- function(DT, model) {

  setDT(DT)
  
	new_data <- DT[, .(
	  indiv_step_id = NA,
	  yr = NA,
		prop_forest = mean(prop_forest, na.rm = TRUE),
	    memory_long_term = mean(memory_long_term, na.rm = TRUE)
		
		), by = id]

	new_data[, h2_long_term := predict(model, .SD, type = 'link', re.form = NULL)]
}
