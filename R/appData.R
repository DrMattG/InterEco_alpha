# set up a new class for model objects and data

methods::setClass("appData", slots = list(data = "data.frame", model = "lm", pred="character",modx="character"))

# make the lm model with an interaction
fitiris <- lm(Petal.Length ~ Petal.Width * Species, data = iris)

#' make data for the app
#' @param data the dataframe that the model is generated from
#' @param model the lm model object (limited to lm for this example)
#' @param pred The name of the predictor variable involved in the interaction.
#' @param modx The name of the moderator variable involved in the interaction.
#' @return an S4 class object with both model and data together (use slots to call each e.g. 'appdata@model')
#' @export
#'
#' @examples
#' appdata <- makeAppData(data = iris, model = fitiris, pred=Petal.width, modx=Species)
makeAppData <- function(data = data, model = model, pred=pred, modx=modx) {
  appdata <- new("appData",
                 data = data,
                 model = model,
                 pred=pred,
                 modx=modx
  )
}

