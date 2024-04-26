#' plot_param_space_scatter
#' @param modelObject A model object
#' @import ggplot2
#' @import dplyr
#' @import GGally
#' @return pairs plot of scatter in parameter space
#' @export

plot_param_space_scatter <- function(model, data) {
  
  vars <- all.vars(formula(model))
  
  covs <- data |>
    dplyr::select(vars) |>
    tidyr::drop_na()
  
  m <- GGally::ggpairs(covs, 
               lower = list(continuous = upper_fn),
               diag = list(continuous = diag_fn),
               upper = "blank",
               progress = FALSE)
  
  # add points at median for density plots
  for (i in 2:m$nrow) {
    for (j in 1:(i-1)) {
      p <- GGally::getPlot(m, i, j)
      
      m[i,j] <- m[i,j] + 
        annotate(geom = "point", x = median(covs[,p$labels$x][[1]], 
                              na.rm = TRUE),
                                   y = median(covs[,p$labels$y][[1]], 
                                              na.rm = TRUE),
                                   col = "red",
                                   size = 3, shape = 16)
    }
  }
  
  # add dotted line at median for histograms
  for(i in 1:m$nrow){
    p <- GGally::getPlot(m, i, i)
    
    m[i,i] <- m[i,i] + 
      geom_vline(xintercept = median(covs[,p$labels$x][[1]], 
                                     na.rm = TRUE),
                                  col = "red",
                                  linetype = 3,
                                  linewidth = 1)
  }
  
  return(m)

}


# helper functions
upper_fn <- function(data, mapping, ...) {
  p <- ggplot(data = data, mapping = mapping) +
    stat_density2d(aes(fill = after_stat(density)), 
                   geom = "tile", contour = FALSE) +
    scale_fill_gradientn(colours = terrain.colors(100)) +
    geom_point(size = 0.5, alpha = 0.6) +
    theme_classic()
  p
}

diag_fn <- function(data, mapping, ...) {
  p <- ggplot(data = data, mapping = mapping) +
    geom_histogram() +
    theme_classic()
  p
}


