#' @title Individual estimates
#' @export
#' @author Jack G Hendrix
indiv_estimates_by_year <- function(models) {
  return(
  lapply(models, function(element) {
    year <- element[[1]]
    model <- element[[2]]
    indiv <- as.data.table(
      coef(model)$cond$id %>% rownames_to_column("id") %>%
        pivot_longer(-id, names_to = "term", values_to = "estimate") %>%
        mutate(method = "ME")
    )
    
    ran_vals.m <- broom.mixed::tidy(model, effect = 'ran_vals')
    indiv.se.m <- setDT(ran_vals.m)[group == 'id', .(id = level, term, se = std.error)]
    indiv <- left_join(indiv, indiv.se.m, by = c('id', 'term'))
    

    indiv %<>% filter(term != "(Intercept)")
    return(list(year,indiv))
  }
    
  
  )
  
  )
}
