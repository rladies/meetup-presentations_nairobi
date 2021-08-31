# afrilearnr-creation.r

# steps to create learnr tutorials package

# andy south 2020-10-14

# https://education.rstudio.com/blog/2020/09/delivering-learnr-tutorials-in-a-package/

library(usethis)

#create new Github repo
#create new RStudio project from the github repo

setwd('..')

usethis::create_package("afrilearnr") #to make a basic package.

#usethis::use_tutorial("<name-of-learnr-file>", "<Title You'd Like the User to See>")

setwd('afrilearnr')
#usethis::use_tutorial("intro-to-sf", "An afrimapr intro to sf")

#restart rstudio for package build tools to appear

remotes::install_github('afrimapr/afrilearndata')
usethis::use_dev_package("afrilearndata") # to add in development package dependencies

# aha mayne then learners will not need to install from github ??

# add cran package dependencies
#usethis::use_package("rnaturalearth")
usethis::use_package("sf")
usethis::use_package("raster")

# ignore all dcf (shinyapps) files in check
use_build_ignore("[.]dcf$", escape = FALSE)
#use_build_ignore("[.]xlsx$", escape = FALSE)

# add a crash course tutorial
usethis::use_tutorial("afrilearnr-crash-course", "A crash course to spatial in R with African data")

# add a test tutorial to try to address issue in join not recognising packages
usethis::use_tutorial("test-sf", "test shinyapps not finding packages in join tutorial")

# add a test tutorial to try to address issue in join not recognising packages
usethis::use_tutorial("test-tmap-view", "test tmap failing in view mode when run by learner")

# add a test tutorial reprex for failing to print all sections to pdf
usethis::use_tutorial("test-learnr-pdf", "reprex for failing to print all sections to pdf")

# add tutorial on getting data in
usethis::use_tutorial("get-my-data-in", "How to get your own spatial data into R")

# add a template tutorial to help authors develop other tutorials in a consistent format
usethis::use_tutorial("template-tutorial", "A template that authors can copy & modify to create new tutorials")

# add tutorial on openstreetmap-data
usethis::use_tutorial("openstreetmap-data", "Download and plot OpenStreetMap data from R")


# create data-raw to save this script that creates the package
usethis::use_data_raw()
# I renamed default DATASET.R to this afrilearnr-creation.r



