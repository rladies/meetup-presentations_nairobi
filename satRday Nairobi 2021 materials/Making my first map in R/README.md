
<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- used devtools::build_readme() to update the md -->

# afrilearnr

<!-- badges: start -->

<!-- badges: end -->

A growing collection of interactive
[learnr](https://rstudio.github.io/learnr/) tutorials for making African
maps.

Online tutorials :

| tutorial name                                                                      | outline                                                       | recommended order |
| ---------------------------------------------------------------------------------- | ------------------------------------------------------------- | ----------------- |
| [intro-to-spatial-r](https://andysouth.shinyapps.io/intro-to-spatial-r/)           | an introduction to spatial data in R                          | 1                 |
| [get-my-data-in](https://andysouth.shinyapps.io/get-my-data-in/)                   | getting your own spatial data into R                          | 2                 |
| [join-admin](https://andysouth.shinyapps.io/join-admin/)                           | dealing with data referenced by names rather than coordinates | 3                 |
| [afrilearnr-crash-course](https://andysouth.shinyapps.io/afrilearnr-crash-course/) | gallery of plots & code with minimal explanation              | 4                 |
| *proposed :*                                                                       |                                                               |                   |
| *colour-my-map*                                                                    | changing map colours in different map packages                |                   |
| *data-manipulation*                                                                | manipulating your data to allow making different maps         |                   |
| *map-my-study-area*                                                                | making a simple map to show where a study area is             |                   |

If you would like to suggest a tutorial for this collection, or
contribute one, please get in touch.

The tutorials are saved as a package that can also be installed and run
locally in RStudio.

## Getting started

1.  Install the package from GitHub from the R console.

<!-- end list -->

``` r
# install.packages("remotes") # if not already installed
remotes::install_github("afrimapr/afrilearnr")
```

2.  Load the package

<!-- end list -->

``` r
library(afrilearnr)
```

3.  In RStudio Click on the *Tutorial* tab at the top right, choose an
    afrilearnr tutorial, and click *Start Tutorial ?*

Alternatively you can start a tutorial by name from the R console :

``` r
learnr::run_tutorial("join-admin", "afrilearnr")
```
