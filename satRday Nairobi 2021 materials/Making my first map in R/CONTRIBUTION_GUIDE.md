# Contribution Guide

For internal & external contributors to the tutorials. Please add anything to this document you find helpful.

See [template tutorial](https://github.com/afrimapr/afrilearnr/blob/main/inst/tutorials/template-tutorial/template-tutorial.Rmd) which sets out standard format, you can copy & paste this to start a new tutorial.

Pull requests welcome from anyone. Internal contributors are encouraged to push text changes directly (you don't need to submit pull requests). To minimise potential for conflicts remember to pull before making changes and communicate with others about what you are working on. 


## to start a new tutorial

1. usethis::use_tutorial("[short-name]", "[Tutorial title]") # this will create a new folder in inst/tutorials, with a new .Rmd file in 
1. copy & paste content of the [template tutorial](https://github.com/afrimapr/afrilearnr/blob/main/inst/tutorials/template-tutorial/template-tutorial.Rmd) into the new .Rmd file to start


## learnr tips

1. headers indicated with '##' become separate sections and appear in index on left


## hazards

1. exercise chunks plotting interactive maps (with tmap or mapview) need to have unique ids set like this :
```{r [chunk-name]-setup}
# to avoid issues with interactive maps https://github.com/rstudio/learnr/issues/529
# IdSeed must be set to be unique in the Rmd, even for mode('plot') to allow user to change
tmap_mode("plot")
htmlwidgets::setWidgetIdSeed(1)
```

2. 2021-01 join-admin previously uploading to shinyapps gave this error
Error in value[[3L]](cond) : there is no package called 'sf'
turned out to be an issue with the fill-the-blanks sections lower down
updating to dev version of packrat locally fixed deployment 
remotes::install_github('rstudio/packrat')
see https://github.com/afrimapr/afrilearnr/issues/4#issue-791404707

3. 2020 intro-to-spatial error on deploying to shinyapps
Error in value[3L] :OGRCreateCoordinateTransformation() returned NULL: PROJ available?
https://stackoverflow.com/questions/61286108/error-in-cpl-transformx-crs-aoi-pipeline-reverse-ogrcreatecoordinatetrans
If you save an sf-dataframe with a newer version of GDAL, and then try on a system with an older version of GDAL, the projection info cannot be read properly.
The solution is to re-set the projection:
st_crs(data) <- 4326

4. when deploying to shinyapps can get an error like this :   
Package 'afrilearndata 0.0.0.9003' was installed from sources; Packrat will assume this package is available from a CRAN-like repository during future restores.
Caused if a package (afrilearndata in this case) has been built locally. SOlution is to reinstall from Github : remotes::install_github("afrimapr/afrilearndata")


