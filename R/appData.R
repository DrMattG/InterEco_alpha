# set up a new class for model objects and data
AppClass=R6::R6Class(classname = "AppData", 
                     public = list(
                       #' @field data the dataframe that the model is generated from
                       data = NULL,
                       #' @field model the model object
                       model = NULL,
                       #' @field pred The name of the predictor variable involved in the interaction.
                       pred= NULL,
                       #' @field modx The name of the moderator variable involved in the interaction
                       modx= NULL,
                       
                       #' @description
                       #' Create a new object.
                       #' @param data dataframe
                       #' @param model model object
                       #' @return A new `AppD` object.
                       initialize = function(data = NA, model = NA, pred=NA, modx=NA) {
                         self$data <- data
                         self$model <- model
                         self$pred<-pred
                         self$modx<-modx
                       }
                     )
                     
)

#' make data for the app
#' @param data the dataframe that the model is generated from
#' @param model the lm model object (limited to lm for this example)
#' @param pred The name of the predictor variable involved in the interaction.
#' @param modx The name of the moderator variable involved in the interaction.
#' @return an R6 class object with both model and data together (use $ to call each e.g. 'appdata$model')
#' @export
#'
#' @examples
#' appdata <- makeAppData(data = iris, model = fitiris, pred="Petal.width", modx="Species")
makeAppData <- function(data = data, model = model, pred=pred, modx=modx) {
    appdata <- AppClass$new(data = data,
                 model = model,
                 pred=pred,
                 modx=modx
  )
}

