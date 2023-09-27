#function to create a template summary rmd file
generateTemplateSummary <- function(filePath){
  rmd <-

'---
title: "Untitled"
author: "Your name"
date: "`r Sys.Date()`"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

Background and rationale

[insert text here]

Study aims and objectives

[insert text here]

Study area

[insert text here]

Sampling design and data collection

[insert text here]

Dependent variables

[insert text here]

Independent variables

[insert text here]

'
  
  writeLines(rmd,filePath)
}

#test
#generateTemplateSummary("my_summary.Rmd")
