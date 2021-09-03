#' home UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList

mod_map_ui <- function(id) {
    ns <- NS(id)
    tagList(
        fluentPage(
            Stack(
                tokens = list(childrenGap = 10),
                div(
                    class = "ms-Grid", dir = "ltr",
                    div(
                        class = "ms-Grid-row",
                        h1("Welcome to the unofficial Kenya census dashboard"),
                        h3("Building on the rKenyaCensus library (https://github.com/Shelmith-Kariuki/rKenyaCensus)")
                    ),
                    div(
                        class = "title",
                        h3("'Kenya's population was reported as 47.6 million during the 2019 census compared to 38.6 million inhabitants 2009, 28.7 million in 1999, 21.4 million in 1989, and 15.3 million in 1979.'")
                    ),
                    div(
                        class = "ms-Grid-row",
                        div(
                            class = "ms-Grid-col ms-sm12 ms-md12 ms-lg6",
                            div(
                                class = "ms-depth-8",
                                div(
                                    class = "card",
                                    h2("Map of total population by county"),
                                    "The legend shows which quantile each county falls in",
                                    leafletOutput(ns("map_pop_counties"), height = "600px", width = "auto")
                                )
                            )
                        ),
                        div(
                            class = "ms-Grid-col ms-sm12 ms-md12 ms-lg6",
                            div(
                                class = "ms-depth-8",
                                div(
                                    class = "card",
                                    h2("Map of population density by county"),
                                    "The legend shows which quantile each county falls in",
                                    leafletOutput(ns("map_PD_counties"), height = "600px", width = "auto")
                                )
                            )
                        )
                    )
                )
            )
        )
    )
}

#' home Server Functions
#'
#' @noRd
mod_map_server <- function(input, output, session) {
    ns <- session$ns

    ## Load the map, convert to sf, reproject and mutate field(s) as necessary
    kenya.counties <- rKenyaCensus::KenyaCounties_SHP
    kenya.counties <- st_as_sf(kenya.counties)
    kenya.counties <- kenya.counties %>%
        st_transform(crs = 4326) %>%
        mutate(Population = as.numeric(as.character(Population)))

    ## Creating color palettes (functions)
    pop.pal <- colorQuantile("YlOrRd", domain = kenya.counties$Population, n = 4)
    pd.pal <- colorQuantile("YlOrRd", domain = kenya.counties$PD, n = 4)

    ## Map of population
    output$map_pop_counties <- renderLeaflet({
        kenya.counties %>%
            leaflet() %>%
            addTiles() %>%
            addPolygons(stroke = FALSE, fill = TRUE, fillColor = ~ pop.pal(Population), fillOpacity = 0.7, label = ~ paste0(kenya.counties$County, ": ", format(Population, big.mark = ","))) %>%
            addScaleBar() %>%
            addLegend(pal = pop.pal, values = ~Population)
    })

    ## Map of population density
    output$map_PD_counties <- renderLeaflet({
        kenya.counties %>%
            leaflet() %>%
            addTiles() %>%
            addPolygons(stroke = FALSE, fill = TRUE, fillColor = ~ pd.pal(PD), fillOpacity = 0.7, label = ~ paste0(kenya.counties$County, ": ", format(PD, big.mark = ","))) %>%
            addScaleBar() %>%
            addLegend(pal = pd.pal, values = ~PD)
    })
}

## To be copied in the UI
# mod_map_ui("map_ui_1")

## To be copied in the server
# mod_map_server("map_ui_1")