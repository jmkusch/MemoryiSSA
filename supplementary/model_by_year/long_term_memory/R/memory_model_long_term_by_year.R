#' @title 
#' @export
#' @author Jillian Kusch
#' 
memory_model_long_term_by_year <- function(DT,years) {
  
  model_years <- lapply(years, function(year)   {
    model <- glmmTMB(
      
      case_ ~ -1 +
        (1 | indiv_step_id) +
        (1 | yr) +
        
        
        prop_forest +
        (0 + prop_forest | id) +
        
        memory_long_term +
        (0 + memory_long_term | id) +
        
        I(log(distancetofusion_long_term + 1)) +
        (0 + I(log(distancetofusion_long_term + 1 ))| id) +
        
        nitrogen_memory_long_term +
        (0 + nitrogen_memory_long_term | id)
      
      
      ,
      
      data = DT[yr == year],
      family = poisson(), 
      
      map = list(theta = factor(c(NA, 1:5))),
      start = list(theta = c(log(1000), seq(0, 0, length.out = 5))),
      control = glmmTMBControl(parallel = (detectCores() - 1))
    )
    #print(year)
     
    return(list(year,model))
  }
  )
  return(model_years)
  
}

