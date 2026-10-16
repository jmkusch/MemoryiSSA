#' @title Prepare model data
#' @export
#' @author Jack G Hendrix, Jillian M. Kusch, Frankie Tu
prepare_model_by_year <- function(DT, season_, valid_years) {

  DT %<>%
    rename(prop_forest = pt_r,
           id = Animal_ID) %>% 
    filter(sl_ > 0)
  
  
  if(season_ == "winter"){
  
  DT<-  DT[season_ == 'winter']  
 }
  
 if(season_ == "summer"){
   
   DT<-  DT[season_ == 'summer',] 
 }
  # remove 2016 and 2017 as lack of data 
  # remove NA before we scale 
  DT <- rbindlist(lapply(valid_years, function(year) { return( DT[yr == year] ) } ))
  # scale short-term and long-term memory to be in range [0,1], 0 being no memory, 1 being perfect memory
  DT[, X:= 1:nrow(DT)]
  na_free_memory <- na.omit(DT[, .(memory_short_term, X)])
  na_free_memory[, memory_short_term_scaled := scale(memory_short_term, center=min(memory_short_term), scale=max(memory_short_term)-min(memory_short_term))]
  
  set(DT,
      i = na_free_memory$X,
      j = "memory_short_term",
      value = na_free_memory$memory_short_term_scaled
  )
  
  
  na_free_memory <- na.omit(DT[, .(memory_long_term, X)])
  na_free_memory[, memory_long_term_scaled := scale(memory_long_term, center=min(memory_long_term), scale=max(memory_long_term)-min(memory_long_term))]
  set(DT,
      i = na_free_memory$X,
      j = "memory_long_term",
      value = na_free_memory$memory_long_term_scaled
  )
  
  DT[, X:= NULL]
  

  # remove columns not used in model fitting 
  DT[, c("memory_short_term", "distancetofusion_short_term", "nitrogen_memory_short_term") := NULL]
    # remove na from data table
  return(DT[complete.cases(DT)])
}
