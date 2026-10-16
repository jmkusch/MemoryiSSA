#' @title Check glmmTMB model
#' @export
#' @author Alec L. Robitaille, Julie W. Turner, Jillian M. Kusch, Frankie Tu
model_check_by_year <- function(models) {
  return(
    lapply(models, function(element) {
      year <- element[[1]]
      model <- element[[2]]
      model_check <- list(
        n_na_std_error = sum(is.na(model$sdr$par.fixed)),
      pd_hess = model$sdr$pdHess
    )
    return(list(year, model_check))
    }
    
    )
  )


}
