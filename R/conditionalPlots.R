#' plot_conditional_effects
#' @param modelObject A model object
#' @import interactions
#' @return faceted conditional effects plot
#' @export

plot_conditional_effects <- function(model, data, pred, modx, modx.values) {
  p <- interactions::interact_plot(model = model,
                              data = data,
                              pred = .data[[pred]],
                              modx = .data[[modx]],
                              plot.points = TRUE,
                              facet.modx = TRUE,
                              interval = TRUE,
                              main.title = "Conditional effects",
                              modx.values = modx.values
  )
  
  return(p)
}
