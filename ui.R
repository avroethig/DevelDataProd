library(shiny)

# Define UI for dataset viewer application
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Gasoline Mileage Prediction"),
    
    sidebarPanel(
      selectInput("variable", "Choose a variable from the dataset:", 
                  choices = c("wt", "qsec", "disp","drat")),
      numericInput('value', 'Value', 3, min = 0, max = 200, step = 1),
      submitButton('Submit'),
      helpText("The variable can be: 
                weight (wt, interval: 1...6 tones), 
                quarter mile time (qsec, interval: 14...22 sec.), 
                displacement (disp, interval: 72...472 cu.in), 
                rear axle ratio (drat, interval: 2...5).
                The prediction of gasoline mileage is based on the dataset mtcars
                from the datasets package and uses a linear model. 
                The predicted gasoline mileage (fit) is given
                in miles/gallon. The corresponding lower and upper limits of the 95%
                confidence interval are given by lwr and upr.")
      ),
    
    mainPanel(
        h3('Results of prediction'),
        h4('You entered'),
        verbatimTextOutput("inputValue"),
        verbatimTextOutput("inputVariable"),
        h4('Which resulted in a prediction of '),
        verbatimTextOutput("prediction")
    )
  )
)

