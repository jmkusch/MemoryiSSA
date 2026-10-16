#' @title Plot boxplot
#' @export
#' @author Julie W. Turner, , Jillian M. Kusch, Frankie Tu
plot_box_horiz_by_year <- function(DTs, theme) {
  lapply(DTs, function(element_) {
    year <- element_[[1]]
    DT <- element_[[2]]
    plot <- ggplot(data = DT[term !='(Intercept)'],
           aes(term, estimate)) +
      geom_boxplot(aes(color = term)) +
      geom_jitter() +
      geom_hline(yintercept = 0, lty = 'dashed') +
      coord_flip() +
      theme
    return(list(year,plot))
  })
  
}
