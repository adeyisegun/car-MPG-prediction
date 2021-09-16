library(shiny)

shinyUI(fluidPage(
    titlePanel("Prediction of MPG"),
    sidebarLayout(
        sidebarPanel(
            helpText("Prediction of MPG (Miles per gallon) considering displacement and Horse power"),
            helpText("Parameters:"),
            sliderInput(inputId = "indis",
                        label = "Displacement (cu.in):",
                        value = 300,
                        min = 70,
                        max = 480,
                        step = 5),
            sliderInput(inputId = "inhp",
                        label = "Horsepower:",
                        value = 200,
                        min = 50,
                        max = 340,
                        step = 5),
            radioButtons(inputId = "inam",
                         label = "Car's Transmission: ",
                         choices = c("automatic"= 0, "manual"= 1)
                         )
        ),
        
        mainPanel(
            htmlOutput("pText"),
            htmlOutput("pred")
        )
    )
))