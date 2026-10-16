#' @title Individual estimates w/ SE
#'  @export
#' @author Jack G Hendrix, Jillian M. Kusch, Frankie Tu
sum_plot_by_year <- function(DTs, model) {


  plots <- lapply(DTs, function(element_)  {
    year <- element_[[1]]
    DT <- element_[[2]]
    DT[,c("mean_estimate", "mean_se") := list(mean(estimate), mean(se)),keyby ="term"]
    fixed <- distinct(DT %>% dplyr::select(popn = term, mean = mean_estimate, mse = mean_se))
    
    gbox <-	ggplot(data = fixed, aes(x = popn, y = mean)) +
      geom_pointrange(data = DT,
                      aes(x = term, y = estimate, 
                          ymin = estimate - se, ymax = estimate + se,
                          colour = id, alpha = 0.5),
                      position = position_jitter(width = 0.3),
                      linetype = "dotted",
                      show.legend = F) +
      geom_pointrange(aes(ymin = mean - mse, ymax = mean + mse)) +
      geom_hline(yintercept = 0, lty = 'dashed') +
      xlab("") +
      ylab("Estimate ± SE") +
      scale_color_viridis(discrete = "TRUE")  +
      scale_fill_viridis(discrete = "TRUE") +
      coord_flip() +
      plot_theme() + 
      labs(title = paste0(year))
    
    ggsave(
      paste0('graphics/summary/', year,'_',model, '_indiv_selection_.png'),
      gbox,
      width = 10,
      height = 10,
      dpi = 320
    )
    return(gbox)
  }
  )
  
  n <- length(plots)
  plt <- plots[[1]]
  for (i in 2:n){
    plt <- plt + plots[[i]]
  }
  ggsave(
    paste0('graphics/summary/',model, '_indiv_selection_.png'),
    plt,
    width = 10,
    height = 10,
    dpi = 320
  )
  return(plots)
}
