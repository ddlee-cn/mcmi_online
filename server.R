
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
# devtools::install_github("ddlee96/mcmi")
library(mcmi)

shinyServer(function(input, output) {
    output$result <- renderText({
        input$mcmi
        # use isolate to enable button
        # or it would be reactive
        isolate(mcmi::mcmi(c(input$x1, input$x2, input$y1, input$y2, input$z1, input$z2), input$integrand, c(input$constrains1, input$constrians2)))
    })

    output$scatterplot <- renderPlotly({
        input$visualize
        isolate(mcmi::visualize_area(c(input$x1, input$x2, input$y1, input$y2, input$z1, input$z2), c(input$constrains1, input$constrains2)))
  })

  #   output$event <- renderPrint({
  #   d <- event_data("plotly_hover")
  #   if (is.null(d)) "Hover on a point!" else d
  # })

})
