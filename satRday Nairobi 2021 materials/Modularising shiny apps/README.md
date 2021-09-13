## Modularising shiny apps

### September 4, 2021

Our trainer: Dr. Tor-G. Vågen, Principal Scientist and head of the Spatial Data Science and Applied Learning Lab (SPACIAL) at CIFOR-ICRAF

This is a repository containing code for the "Modularizing Shiny Apps" R Ladies Nairobi workshop on Sept 4, 2021. In the workshop, we will explore how modules can help us better manage Shiny apps when they become a bit large and/or complex. We will develop a simple dashboard with maps, graphics and some simple statistical models/analysis (if time). 

We will be using data from the rKenyaCensus R library developed by Shel Kariuki, which can be installed by running the following code in R: _devtools::install_github("Shelmith-Kariuki/rKenyaCensus”)_.  

The workshop will build on a number of R libraries such as leaflet, sf, data.table, plotly, ggplot2, and of course shiny. We will use shiny.react, shiny.router and shiny.fluent, which are all developed by the amazing team at Appsilon (appsilon.com). For more information and installation instructions, have a look at https://github.com/Appsilon. The workshop requires some experience with the development of Shiny apps and general experience with R Statistics, including functions. We will develop a simple dashboard live as part of the session, so participants will need a stable internet connection to be able to follow along.

### We will be using the following libraries:

- library(shiny)
- library(shiny.fluent) # remotes::install_github("Appsilon/shiny.fluent")
- library(shiny.react)  # remotes::install_github("Appsilon/shiny.react")
- library(shiny.router) # remotes::install_github("Appsilon/shiny.router")
- library(data.table)
- library(plotly)
- library(leaflet)
- library(leafem)
- library(leaflet.extras)
- library(sf)
- library(stringr)
- library(rKenyaCensus) # devtools::install_github("Shelmith-Kariuki/rKenyaCensus")

### Tentative agenda

- Brief introduction to the concept behind modules in Shiny
- Setting up the folder structure for the app (this folder)
- Livecoding (demonstration):
  - app.R - shiny.router and shiny.fluent
  - The homepage module (mod_home.R)
  - Module with maps of population data by county in Kenya (mod_map.R)

_At the end of the session we will have a simple Shiny dashboard!_

Please note that participants should have good working knowledge in R in order to follow along. All the code is available in this repository, so don't worry if you miss parts of the demonstration. You can always access it all here.
