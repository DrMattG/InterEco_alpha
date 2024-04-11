#' plot_resids
#' @param modelObject A model object
#' @import ggplot2
#' @import DHARMa
#' @importFrom dplyr mutate
#' @return plot of redsiduals
#' @export

plot_resids <- function(model, data){
  
  resDHARMa <- DHARMa::simulateResiduals(model, plot = FALSE, 
                                         integerResponse = T)
  
  p <- data |> dplyr::mutate(
    resids = resDHARMa$scaledResiduals,
    predicted = resDHARMa$fittedPredictedResponse,
    observed = resDHARMa$observedResponse
  ) |>
    dplyr::select(all.vars(formula(model))[-1]) |>
    tidyr::pivot_longer(cols = all.vars(formula(appdata$model))[-1],
                        names_to = "vars") |>
    ggplot2::ggplot(aes(x = vars, y = value)) +
    ggplot2::geom_jitter(
      width = 0.1,
      shape = 16,
      alpha = 0.5
    ) +
    ggplot2::facet_wrap( ~ vars, scales = "free_x") +
    ylab("Scaled residuals") +
    xlab("Variable") +
    scale_color_discrete(guide = "none") +
    ggtitle("Residuals") +
    geom_smooth()
  
  return(p)
}
