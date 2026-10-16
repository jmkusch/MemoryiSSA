#' @title 
#' @export
#' @author Jillian M. Kusch, Frankie Tu
save_rss_plot <- function(name, A, B)
  
{
  
  ggsave(paste0("graphics/rss/",name, ".png"),
         plot = A + B,
         width = 2000,
         height = 1500,
         dpi = 320,
         units="px")


}
