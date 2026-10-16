#' @title issa short term memory model  
#' @export
#' @author Jillian M. Kusch
#' 
memory_model_short_term_by_year <- function(DT,years) {

  model_years <- lapply(years, function(year)   {
    model <- glmmTMB(

  		case_ ~ -1 +
  		  (1 | indiv_step_id) +
  		  (1 | yr) +
  		  
  		  
  		  prop_forest +
          (0 + prop_forest | id) +
  		  
  		  memory_short_term +
  		  (0 + memory_short_term | id) +
  		  
  		  I(log(distancetofusion_short_term +1))+
  		  (0 + I(log(distancetofusion_short_term +1)) | id) +
  		  
  		  nitrogen_memory_short_term +
  		  (0 + nitrogen_memory_short_term | id) 
  
  	
          ,
  
  		data = DT[yr == year],
  		family = poisson(), 


    	map = list(theta = factor(c(NA, 1:5))),
    	start = list(theta = c(log(1000), seq(0, 0, length.out = 5))),

  		
    )
	return(list(year,model))
  })
	return(model_years)
	
}
