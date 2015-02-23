library(shiny)
data(mtcars)
meanMPG <- function(cylind, weightMin, weightMax, transm){
  cars <- na.omit(subset(mtcars, cyl == cylind, c(cyl, wt, am, mpg)))
  cars <- na.omit(subset(mtcars, wt >= weightMin, c(cyl, wt, am, mpg)))
  cars <- na.omit(subset(mtcars, wt <= weightMax, c(cyl, wt, am, mpg)))
  cars <- na.omit(subset(mtcars, am == transm, c(cyl, wt, am, mpg)))
  if(length(cars$mpg) != 0){
    mean(cars$mpg)
  }else{
    'Sorry, there is no data for specified characteristics. Try other variants'
  }
}

shinyServer(
  function(input, output) {
    
    output$inputValue <- renderPrint({input$cyl})
    
    output$weightText <- renderText({paste('You have chosen a range that goes from',
                                           input$slider1[1], 'to', input$slider1[2])})
    
    output$radioValue <- renderText({ifelse(input$radio == 0, 'Automatic', 'Manual')})

    output$aveMPG <- renderText(meanMPG(input$cyl, input$slider[1], input$slider[2], input$radio))
  }
)
