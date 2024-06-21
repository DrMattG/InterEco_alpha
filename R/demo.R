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
source("R/vifPlots.R")
source("R/residualPlots.R")
source("R/paramSpacePlot.R")
source("R/referencesTab.R")
source("R/conditionalPlots.R")
library("ggplot2") #workaround 

#create your study summary page
source("R/generateTemplateSummary.R")
generateTemplateSummary("test.Rmd") #creates the template which you can go and edit


# mtcars example ----------------------------------------------------------

# make the lm model with an interaction
mtcars_mod <-lm(mpg ~ hp * wt,data = mtcars)

#create the appData object
appdata <- makeAppData(data = mtcars, model = mtcars_mod, pred = "hp", modx = "wt")


# ants example ------------------------------------------------------------

load(here::here("data", "ants_data.rda"))
load(here::here("data", "bestmod.rda"))

appdata <- makeAppData(data = ants, model = bestmod, pred = "lt_clim", modx = "woody")


# generate interEco app and launch ----------------------------------------

generateInterEco(appdata)
