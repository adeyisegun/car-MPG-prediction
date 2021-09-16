
library(shiny)
data("mtcars")
library(dplyr)
library(ggplot2)

mtcars$am <- factor(mtcars$am) 
# linear model
model1 <- lm(mpg ~ disp + hp + am, data=mtcars)

shinyServer(function(input, output) {
    output$pText <- renderText({
        paste("Displacement is",
              strong(input$indis),
              "cu.in, and gross horsepower is",
              strong(input$inhp),
              ", then:")
    })
    output$pred <- renderText({
        df <- data.frame(disp=input$indis,
                         hp=input$inhp,
                         am=factor(input$inam, levels=levels(mtcars$am)))
        ch <- predict(model1, newdata=df)
        
        paste0("Car's predicted MPG is ",
               strong(round(ch,1)),
               " miles/gallon"
        )
    })
    
})