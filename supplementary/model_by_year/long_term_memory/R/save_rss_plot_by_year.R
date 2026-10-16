save_rss_plot_by_year <- function(As, nameA, 
                                  Bs, nameB,
                                  Cs, nameC,
                                  Ds, nameD)
  
{
  library(patchwork)
  indiv_height = 2000
  indiv_width = 1500
  
  new_plots <- lapply(As, function(A_, nameA) {
    year <- A_[[1]]
    A <- A_[[2]] 
    # rename plot title
    
    ggsave(paste0("graphics/rss/",year,"_",nameA, ".png"),
           plot = A,
           width = indiv_height,
           height = indiv_width,
           dpi = 320,
           units="px")
    A <- A + labs(title=paste(year))
    return(A)
  },nameA)
  
  n <- length(new_plots)
  plt <- new_plots[[1]]
  for (i in 2:n){
    plt2 <- new_plots[[i]]
    plt <- plt + plt2
  }
  plt <- plt 
  
  ggsave(paste0("graphics/rss/",nameA, ".png"),
         plot = plt,
         width = indiv_height*2,
         height = indiv_width*2,
         dpi = 320,
         units="px")
  
  # B plots -------------
  new_plots <- lapply(Bs, function(B_, nameB) {
    year <- B_[[1]]
    B <- B_[[2]] 
    ggsave(paste0("graphics/rss/",year,"_",nameB, ".png"),
           plot = B,
           width = indiv_height,
           height = indiv_width,
           dpi = 320,
           units="px")
    
    B <- B + labs(title=paste(year))
    return(B)
  }, nameB)
  
  n <- length(new_plots)
  plt <- new_plots[[1]]


  for (i in 2:n){
    plt2 <- new_plots[[i]]
    plt <- plt + plt2
  }
  plt <- plt 
  
  
  ggsave(paste0("graphics/rss/",nameB, ".png"),
         plot = plt,
         width = indiv_height*2,
         height = indiv_width*2,
         dpi = 320,
         units="px")
  
  
  
  # C plots ----------
  new_plots <- lapply(Cs, function(C_, nameC) {
    year <- C_[[1]]
    C <- C_[[2]] 
    ggsave(paste0("graphics/rss/",year,"_",nameC, ".png"),
           plot = C,
           width = indiv_height,
           height = indiv_width,
           dpi = 320,
           units="px")
    A <- C + labs(title=paste(year))
    return(A)
  },nameC)
  
  n <- length(new_plots)
  plt <- new_plots[[1]]
  for (i in 2:n){
    plt2 <- new_plots[[i]]
    plt <- plt + plt2
  }
  plt <- plt 

  
  ggsave(paste0("graphics/rss/",nameC, ".png"),
         plot = plt,
         width = indiv_height*2,
         height = indiv_width*2,
         dpi = 320,
         units="px")
  
  
  # D plots ------------
  new_plots <- lapply(Ds, function(D_,nameD) {
    year <- D_[[1]]
    D <- D_[[2]] 
    ggsave(paste0("graphics/rss/",year,"_",nameD, ".png"),
           plot = D,
           width = indiv_height,
           height = indiv_width,
           dpi = 320,
           units="px")
    A <- D + labs(title=paste(year))

    return(A)  
    },nameD)
  
  n <- length(new_plots)
  plt <- new_plots[[1]]

  for (i in 2:n){
    plt2 <- new_plots[[i]]

    plt <- plt + plt2
  }
  plt <- plt 
  

  ggsave(paste0("graphics/rss/",nameD, ".png"),
         plot = plt,
         width = indiv_height*2,
         height = indiv_width*2,
         dpi = 320,
         units="px")
  
}


