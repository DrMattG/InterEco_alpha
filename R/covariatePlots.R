# Plotting functions to visualize the covariate space 

# vsisualize the covariate space and show locations of median values
#' @param covs character string of all model predictors
#' @param data dataframe
#'
#' @return
#' @export
#'
#' @examples
#' 
#'  appdata <- makeAppData(data = mtcars, model = fiti, pred="hp", modx="wt")
#'  covariatespacePlot(D = appdata$pred, X = appdata$modx, data = appdata$data)

#for ants covs is "lt_clim","woody","perc_clay","bare","lui","exotic_grnd"

covariatespacePlot<-function(covs, data){
  
  #get covariate data frame
  covs <- data[,covs]
  covs <- covs[complete.cases(covs),]
  
  #functions for the ggpairs plot
  upper_fn <- function(data, mapping, ...){
    p <- ggplot(data = data, mapping = mapping) + 
      stat_density2d(aes(fill=..density..), geom="tile", contour = FALSE) +
      scale_fill_gradientn(colours=terrain.colors(100)) +
      geom_point(size=0.5, alpha = 0.5)
    p
  }
  
  diag_fn <- function(data, mapping, ...){
    p <- ggplot(data = data, mapping = mapping) + 
      geom_histogram() +
      theme_bw()
    p
  }
  
  #get the basic plot
  m <- ggpairs(covs, 
               lower = list(continuous = upper_fn),
               diag = list(continuous = diag_fn),
               upper = 'blank',
               progress  =FALSE)
  
  #modify the off-diags to add on the median covariate value locations
  for (i in 2:m$nrow) {
    for (j in 1:(i-1)) {
      p <- getPlot(m, i, j)
      m[i,j] = m[i,j] + geom_point(x = median(covs[,p$labels$x][[1]], na.rm=T),
                                   y = median(covs[,p$labels$y][[1]], na.rm=T),
                                   col = "red",
                                   size = 3)
    }
  }
  
  #modify the diags with lines to higlight the location of the median values further
  for(i in 1:m$nrow){
    p <- getPlot(m, i, i)
    
    m[i,i] <- m[i,i] + geom_vline(xintercept = median(covs[,p$labels$x][[1]], na.rm=T),
                                  col = "red",
                                  linetype = "dotted",
                                  linewidth = 1.5)
  }

}



