## Load required libraries
library(shiny)
library(shiny.fluent)
library(shiny.react)
library(shiny.router)
library(data.table)
library(plotly)
library(leaflet)
library(leafem)
library(leaflet.extras)
library(sf)
library(stringr)
library(rKenyaCensus)

## Source modules
source("mod_home.R")
source("mod_map.R")

## Set up page
HorizontalStack <- function(...) {
    Stack(
        horizontal = TRUE,
        tokens = list(childrenGap = 10),
        ...
    )
}

### Create "routes" for navigation within the App
router <- make_router(
    route("home", shiny::div(mod_home_ui("home_ui_1"))),
    route("map", shiny::div(mod_map_ui("map_ui_1")))
)
### Page sections
#### Header
header <- tagList(
    img(src = "https://fvmstatic.s3.amazonaws.com/maps/m/KE-EPS-02-6001.png", class = "logo"),
    div(Text(variant = "xLarge", "Kenya Census Dashboard"), class = "title")
)

#### Navigation
navigation <- Nav(
    groups = list(
        list(
            links = list(
                list(
                    name = "Home",
                    url = "#!/home",
                    key = "home",
                    icon = "Home"
                )
            )
        ),
        list(
            links = list(
                list(
                    name = "Map",
                    url = "#!/map",
                    key = "map",
                    icon = "Map"
                )
            )
        )
    ),
    initialSelectedKey = "home",
    styles = list(
        root = list(
            height = "100%",
            boxSizing = "border-box",
            border = "1px solid #eee",
            overflowY = "auto"
        )
    )
)

#### Footer
footer <- Stack(
    horizontal = TRUE,
    horizontalAlign = "space-between",
    # tokens = list(childrenGap = 5),
    Text(variant = "medium", "Workshop on how to use modules in Shiny apps", block = TRUE),
    Text(variant = "medium", nowrap = FALSE, "Also introducting shiny.router, shiny.fluent and shiny.react")
)

#### Bringing it all together
layout <- function(mainUI) {
    div(
        class = "grid-container",
        div(class = "header", header),
        div(class = "sidenav", navigation),
        div(class = "main", mainUI),
        div(class = "footer", footer)
    )
}

#### Dependencies and resources
#### shiny.router dependencies do not get picked up because they're added in a non-standard way.
shiny::addResourcePath("shiny.router", system.file("www", package = "shiny.router"))
shiny_router_js <- file.path("shiny.router", "shiny.router.js")

## Now we can move onto the UI part of our dashboard...

app_ui <- function(request) {
    tagList(
        tags$script(HTML("
        Fluent = jsmodule['@fluentui/react']
        Fluent.loadTheme({
          defaultFontStyle: { fontFamily: 'Lato', fontWeight: 'regular' }
        })
      ")),
        # Leave this function for adding external resources
        # golem_add_external_resources(),
        # Your application UI logic
        fluentPage(
            suppressDependencies("bootstrap"),
            htmltools::htmlDependency(
                "office-ui-fabric-core",
                "11.0.0",
                list(href = "https://static2.sharepointonline.com/files/fabric/office-ui-fabric-core/11.0.0/css/"),
                stylesheet = "fabric.min.css"
            ),
            shiny::tags$body(
                class = "ms-Fabric",
                dir = "ltr",
                layout(router$ui)
            ),
            tags$head(
                tags$link(href = "style.css", rel = "stylesheet", type = "text/css"),
                shiny::tags$script(type = "text/javascript", src = shiny_router_js)
            )
        )
    )
}


#### ...and the server bit for loading modules, etc.
app_server <- function(input, output, session) {
    router$server(input, output, session)
    # Your application server logic

    callModule(mod_home_server, "home_ui_1")
    callModule(mod_map_server, "map_ui_1")
}


shinyApp(app_ui, app_server)