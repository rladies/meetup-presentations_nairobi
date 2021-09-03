#' home UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList

mod_home_ui <- function(id) {
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
                                    h2("Total population by gender in each county"),
                                    plotlyOutput(ns("pop_gender_county"), height = "550px", width = "auto")
                                )
                            )
                        ),
                        div(
                            class = "ms-Grid-col ms-sm12 ms-md12 ms-lg6",
                            div(
                                class = "ms-depth-8",
                                div(
                                    class = "card",
                                    h2("Population density in each county"),
                                    plotlyOutput(ns("pop_dens_county"), height = "550px", width = "auto")
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
mod_home_server <- function(input, output, session) {
    ns <- session$ns

    ## Load data
    ### View(DataCatalogue) to see a list of all the datasets in the library
    kenya.pop.gender.county <- data.table(V1_T2.2)
    kenya.pop.area.county <- data.table(V1_T2.4)
    colnames(kenya.pop.area.county) <- c("County", "Population", "Area", "PopDens") ## Area in sq km

    ## Remove spaces in county names
    kenya.pop.area.county <- kenya.pop.area.county[, County := str_remove_all(County, " ")]

    output$pop_gender_county <- renderPlotly({
        kenya.pop.gender.county[County != "Total"] %>%
            plot_ly(
                x = ~ reorder(County, -Total), y = ~Male,
                type = "bar", color = I("blue"), name = "Male population"
            ) %>%
            add_bars(
                x = ~ reorder(County, -Total), y = ~Female,
                type = "bar", color = I("orange"), name = "Female population"
            ) %>%
            layout(xaxis = list(title = "County"), yaxis = list(title = "Population in 2019"))
    })

    output$pop_dens_county <- renderPlotly({
        kenya.pop.area.county[County != "Kenya"] %>%
            plot_ly(
                x = ~PopDens, y = ~ reorder(County, PopDens),
                type = "bar", orientation = "h", color = I("#ff4800")
            ) %>%
            layout(
                xaxis = list(title = "Population density (total population / square km)"),
                yaxis = list(title = "County", showticklabels = TRUE, tickmode = "linear")
            )
    })
}

## To be copied in the UI
# mod_home_ui("home_ui_1")

## To be copied in the server
# mod_home_server("home_ui_1")