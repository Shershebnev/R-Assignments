library(shiny)
shinyUI(pageWithSidebar(
  headerPanel('MPG prediction'),
  sidebarPanel(
    numericInput('cyl', 'Number of Cylinders', 6, min = 4, max = 8, step = 2),
    sliderInput('slider1', label = h3('Select min and max weight'), min = 1.5, max = 5.5,
                value = c(2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0)),
    radioButtons('radio', label = h3('Transmission type'), choices = list('Automatic' = 0,
                                                                         'Manual' = 1), 
                selected = 1),
    br(),
    br(),
    submitButton('Submit')
  ),
  mainPanel(
    h3('Your choice:'),
    h4('Number of cylinders:'),
    verbatimTextOutput('inputValue'),
    h4('Weight range:'),
    verbatimTextOutput('weightText'),
    h4('Transmission type:'),
    verbatimTextOutput('radioValue'),
    br(),
    br(),
    h3('Average MPG for this characteristics is...'),
    verbatimTextOutput('aveMPG')
  )
))


