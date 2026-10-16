#' @title
#' @export
#' @author Jillian M. Kusch
#' 
memory_model_long_term <- function(DT) {


  
 	glmmTMB(

		case_ ~ -1 +
		  (1 | indiv_step_id) +
		  (1 | yr) +
		  
		  
		  prop_forest +
      (0 + prop_forest | id) +
		  
      season_memory +
      (0 + season_memory | id) 

	
        ,

		data = DT,
		family = poisson(), 


	map = list(theta = factor(c(NA, 1:3))),
	start = list(theta = c(log(1000), seq(0, 0, length.out = 3)))
	)
}
