
# Newtork and Graphs in R for Biology

Our trainer: **Dr. Susan Holmes, Professor of Statistics at Staford University**

## Prerequisites

`if (!requireNamespace("BiocManager", quietly = TRUE))

  install.packages("BiocManager")`

`BiocManager::install("phyloseq")

library(phyloseq)`

### Packages of interest

`packages = c("ggplot2", "igraph", "tidygraph",
             "ape", "ggplot2", "rworldmap", "ggnetwork",
             "phyloseqGraphTest", "learnr","ggforce")`

### Load or install all

`package.check <- lapply(
  packages,
  FUN = function(x) {
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      library(x, character.only = TRUE)
    }
  }
)

devtools::install_github("spholmes/GraphsTutorial")

library(GraphsTutorial)`
