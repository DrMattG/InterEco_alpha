% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/appData.R
\name{makeAppData}
\alias{makeAppData}
\title{make data for the app}
\usage{
makeAppData(data = data, model = model, pred = pred, modx = modx)
}
\arguments{
\item{data}{the dataframe that the model is generated from}

\item{model}{the lm model object (limited to lm for this example)}

\item{pred}{The name of the predictor variable involved in the interaction.}

\item{modx}{The name of the moderator variable involved in the interaction.}
}
\value{
an R6 class object with both model and data together (use slots to call each e.g. 'appdata$model')
}
\description{
make data for the app
}
\examples{
appdata <- makeAppData(data = iris, model = fitiris, pred="Petal.width", modx="Species")
}
