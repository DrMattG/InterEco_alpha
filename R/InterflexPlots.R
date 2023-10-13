#Plotting functions from package interflex

#' RawPlot from interflex 
#'
#' @param Y Outcome variable 
#' @param D Treatment variable
#' @param X Moderating variable
#' @param Ylabel Label for Y
#' @param Dlabel Label for D
#' @param Xlabel Label for X
#' @param data dataframe
#'
#' @return Plot of Raw data interaction plot
#' @export
#'
#' @examples
#' appdata <- makeAppData(data = mtcars, model = fiti, pred="hp", modx="wt")
#' RawPlot(Y = "mpg", D = appdata$pred,X = appdata$modx,Ylabel="mpg", Xlabel=appdata$modx,
#' Dlabel = appdata$pred,data = appdata$data)

RawPlot<-function(Y, D, X, Ylabel,Dlabel,Xlabel, data){
  interflex::interflex(estimator = "raw",Y = Y, D = D,
            X = X, data = data, weights = NULL, 
            Ylabel = Ylabel, Dlabel = D, 
            Xlabel=X, main = "Linear Interaction Diagnostic (LID) plot", cex.main = 1.2, 
            #diff.values = ,
            ncols=2)+
    ggplot2::theme_bw()
}


#' Marginal effects plot from interflex
#'
#' @param Y Outcome variable 
#' @param D Treatment variable
#' @param X Moderating variable
#' @param data dataframe
#'
#' @return
#' @export
#'
#' @examples
#'  appdata <- makeAppData(data = mtcars, model = fiti, pred="hp", modx="wt")
#'  marginaleffectsPlot(Y = "mpg", D = appdata$pred,X = appdata$modx,data = appdata$data)

marginaleffectsPlot<-function(Y, D, X,data){
 interflex::interflex(Y = Y, D=D,
            X = X, 
            data = data,
            estimator = "binning", 
            vcov.type = "robust", 
            main = "Marginal Effects")
  
}



