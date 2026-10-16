population_mean_estimates_by_year <- function(DTs, season_) {
  if (season_ == "summer") {
    return(
      lapply(DTs, function(element_) {
        year <- element_[[1]]
        DT <- element_[[2]]
      DT[ , let(mean_estimate = mean(estimate) , mean_se = mean(se), season = "summer" ), by=.(term) ]
      result <- unique(DT[, .(term, mean_estimate, mean_se, season)])
      return(list(year, result))
      } )
    )
  }
  if (season_ == "winter") {
    return(
      lapply(DTs, function(element_) {
        year <- element_[[1]]
        DT <- element_[[2]]
        DT[ , let(mean_estimate = mean(estimate) , mean_se = mean(se), season = "winter" ), by=.(term) ]
        result <- unique(DT[, .(term, mean_estimate, mean_se, season)])
        return(list(year, result))
      })
      
   ) 
  }
  return(DT)
}