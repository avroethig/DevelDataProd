library(shiny)
library(datasets)

mpgPrediction <- function(predictor,new_value) 
{
  var <- mtcars[[sub("\"","",sub("\"","",deparse(predictor)))]]
  fitCar <- lm(mpg ~ var , data = mtcars )
  predict(fitCar,data.frame(var = new_value),interval = "prediction")
}

shinyServer(
  function(input, output) {
    VarInput <- reactive({
      switch(input$variable,
             "wt" = substitute(wt),
             "qsec"   = substitute(qsec),
             "disp"   = substitute(disp),
             "drat"   = substitute(drat))
    })
    output$inputValue      <- renderPrint({input$value})
    output$inputVariable   <- renderPrint({input$variable})
    output$prediction      <- renderPrint({mpgPrediction(input$variable,input$value)})
  }
)
