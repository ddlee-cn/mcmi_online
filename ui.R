
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Old Faithful Geyser Data"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      fluidRow(column(4, helpText("Dimension:")),
            column(4, selectInput("dim", NULL, c("2"=2,"3"=3), selected="3"))),
      fluidRow(column(4, helpText("Bounds")),
            column(4, helpText("min")),
            column(4, helpText("max"))),
      fluidRow(column(4, helpText("x")),
            column(4, numericInput("x1", NULL, 0)),
            column(4, numericInput("x2", NULL, 1))),
      fluidRow(column(4, helpText("y")),
            column(4, numericInput("y1", NULL, 0)),
            column(4, numericInput("y2", NULL, 1))),
      fluidRow(column(4, helpText("z")),
            column(4, numericInput("z1", NULL, 0)),
            column(4, numericInput("z2", NULL, 1))),

      fluidRow(column(4, helpText("Integrand")),
            column(4, textInput("integrand", NULL, "1"))),

      fluidRow(column(4, helpText("constrains")),
            column(4, textInput("constrains1", NULL, "1"))),
      fluidRow(column(4, helpText("")),
            column(4, textInput("constrains2", NULL, "1"))),

      fluidRow(column(2, helpText("")),
               column(4, actionButton("mcmi", "Calculate!")),
               column(1, helpText("")),
               column(4, actionButton("visualize", "Visualize!")))

    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
