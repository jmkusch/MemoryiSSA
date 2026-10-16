#' @title Plot RSS
#' @export
#' @author Julie W. Turner, Alec L. Robitaille, Jillian M. Kusch, Frankie Tu
plot_rss_by_year <- function(rsses, theme,plot_labels, x_scales = NULL) {
  
  # convert from m to km when dealing with distance to fusion
  plots <- lapply(rsses, function(rss_) {
    year <- rss_[[1]]
    rss <- rss_[[2]]
    rss %<>% mutate(x = ifelse(x > 1, x/1000, x))
    
    plot <- ggplot(data = rss, aes(x, rss)) +
      geom_line(aes(group = id, colour = id, alpha = .0001),
                linetype = 'twodash', show.legend = F
      )+
      geom_smooth(linewidth = 1.2,
                  colour = "black",
                  fill = "darkgrey",
                  method = "lm",
                  formula = ifelse(mean(rss$x) > 1, "y ~ log(x+1)", "y ~ x")) +
      geom_hline(
        yintercept = 0,
        colour = "black",
        lty = 2,
        linewidth = .7
      ) +
      scale_color_viridis(discrete = "TRUE")  +
      scale_fill_viridis() +
      plot_theme() +
      plot_labels + 
      x_scales
      return(list(year,plot))
})
  return(plots)
}
