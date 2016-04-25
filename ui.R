#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

titanic <- read.csv("data/titanic.csv")

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  # Application title
  titlePanel("Survival on the Titanic"),
  # Sidebar
  sidebarLayout(
    sidebarPanel(
      conditionalPanel(
        'input.tab === "table"',
        checkboxGroupInput('show_vars', 'Columns in Dataset to Show:',
                           names(titanic), selected = c("Survived","Pclass","Sex","Age","Cabin","Gender")
                             )
      ),
      conditionalPanel(
        'input.tab === "tree"',
        checkboxGroupInput('model_vars', 'Columns in Dataset to Use in Model:',
                           names(titanic), selected = c("Survived","Pclass","Sex","Age","Gender"))
      )
    ),
    
    
    mainPanel(
      tabsetPanel(
        id = 'tab',
        tabPanel('table', DT::dataTableOutput('table')),
        tabPanel('tree', plotOutput("distPlot"))
      )
    )
  )
))
