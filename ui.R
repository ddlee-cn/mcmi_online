
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
# import plotlyOutput function
library(plotly)

shinyUI(fluidPage(

  # Application title
  titlePanel("MCMI Demo"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      fluidRow(helpText("MCMI: a R package for calculating"),
             helpText("and visualizing multiple integral"),
             helpText("using Monte Carlo method."),
             a("learn more >>",href="https://projects.ddlee.cn/list/mcmi.html")),
      fluidRow(column(3, helpText("Bounds")),
            column(4, helpText("min")),
            column(4, helpText("max"))),
      fluidRow(column(3, helpText("x")),
            column(4, numericInput("x1", NULL, -2)),
            column(4, numericInput("x2", NULL, 2))),
      fluidRow(column(3, helpText("y")),
            column(4, numericInput("y1", NULL, -2)),
            column(4, numericInput("y2", NULL, 2))),
      fluidRow(column(3, helpText("z")),
            column(4, numericInput("z1", NULL, -1)),
            column(4, numericInput("z2", NULL, 1))),

      fluidRow(column(3, helpText("Integrand")),
            column(4, textInput("integrand", NULL, "1"))),

      fluidRow(column(3, helpText("constrains")),
            column(7, textInput("constrains1", NULL, "x^2/4+y^2/4+z^2/1<1"))),
      fluidRow(column(3, helpText("")),
            column(7, textInput("constrains2", NULL, "x<y^2"))),

      fluidRow(column(1, helpText("")),
               column(3, actionButton("mcmi", "Calculate!")),
               column(1, helpText("")),
               column(3, actionButton("visualize", "Visualize!")))

    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotlyOutput("scatterplot"),
      fluidRow(column(4, helpText("Result:")),
               column(4, textOutput("result"))),
      # verbatimTextOutput("event")


      fluidRow(helpText("Demo only support 3D, input lower and upper bound, integrand and optional constrains."))
    )
  )
))
