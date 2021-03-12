if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("phyloseq")

library(phyloseq)

## First specify the packages of interest
packages = c("igraph", "tidygraph", 
             "ape", "rworldmap", "ggnetwork", 
             "phyloseqGraphTest", "learnr","ggforce")

## Now load or install&load all
package.check <- lapply(
  packages,
  FUN = function(x) {
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      library(x, character.only = TRUE)
    }
  }
)

devtools::install_github("spholmes/GraphsTutorial")

library(GraphsTutorial)
