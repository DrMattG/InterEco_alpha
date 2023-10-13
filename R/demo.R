# load pacakges
library(shiny)

# run functions
source("R/appData.R")
source("R/landingtab.R")
source("R/summaryTab.R")
source("R/validityTab.R")
source("R/interpretationTab.R")
source("R/generateInterEco.R")
source("R/InterflexPlots.R")

#create your study summary page
source("R/generateTemplateSummary.R")
generateTemplateSummary("test.Rmd") #creates the template which you can go and edit

# make the lm model with an interaction
#fitiris <- lm(Petal.Length ~ Petal.Width * Species, data = iris)
fiti<-lm(mpg~hp*wt,data=mtcars)
#create the appData object
#appdata <- makeAppData(data = iris, model = fitiris, pred="Petal.Width", modx="Species")
appdata <- makeAppData(data = mtcars, model = fiti, pred="hp", modx="wt")

#generate interEco app and launch
generateInterEco(appdata)
