#' @title Predict H1 long term forest
#' @export
#' @author Jillian Kusch
predict_h1_forest_long_term <- function(DT, model) {
	N <- 100L

	setDT(DT)
	
	new_data <- DT[, .(
	  indiv_step_id = NA ,
	  yr = NA,
	  prop_forest = seq(from = 0, to = 1, length.out = N),
	  memory_long_term = mean(memory_long_term, na.rm = TRUE),

	), by = id]
	
	new_data[, h1_forest_long_term := predict(model, .SD, type = 'link', re.form = NULL)]

	new_data[, x := seq(from = 0, to = 1, length.out = N), by = id]
}
