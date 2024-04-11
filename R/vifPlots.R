#' plot_vif
#' @param modelObject A model object
#' @import ggplot2
#' @importFrom car vif
#' @importFrom stats coef
#' @return plot of VIF
#' @export

plot_vif <- function(x){
  if (length(stats::coef(x)) < 3){
    stop("You need more than 1 predictor to calculate VIFs")
  }
  VIF <- car::vif(x)
  if(!is.null(dim(VIF))){
    VIF <- VIF[,1]
  }
  
  df <- data.frame(var = names(VIF), value = as.numeric(VIF))
  df$flag <- ifelse(df$value > 5, 1, 0)
  df$flag <- factor(df$flag, levels=c(0, 1))
  p <- ggplot2::ggplot(df, aes(x = value, y = var, color = flag)) +
    ggplot2::geom_point(size = 2) +
    ggplot2::geom_segment(aes(x = 0, xend = value, y = var, yend = var)) +
    ggplot2::geom_vline(xintercept = c(4, 10), color = "grey",
               linetype = "dashed") +
    scale_color_manual(values = c("black", "red"), drop = FALSE) +
    scale_x_continuous(expand = c(0, 0)) +
    labs(subtitle = "Assessing multicollinearity",
         title = "Variance Inflation Factors",
         y = "",
         x = "VIF") +
    theme(legend.position = "none",
          plot.subtitle = element_text(size = 9))
  return(p)
}