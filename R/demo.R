library(shiny)
source("R/appData.R")
source("R/landingtab.R")
source("R/summaryTab.R")
source("R/validityTab.R")
source("R/interpretationTab.R")
source("R/generateInterEco.R")

source("R/generateTemplateSummary.R")
generateTemplateSummary("test.Rmd")

# make the lm model with an interaction
fitiris <- lm(Petal.Length ~ Petal.Width * Species, data = iris)
appdata<-makeAppData(data = iris, model = fitiris, pred="Petal.Width", modx="Species")
generateInterEco(appdata)


