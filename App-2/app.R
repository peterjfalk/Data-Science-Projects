install.packages("shiny")

library(shiny)

# Define UI ----

ui <- fluidPage(
  titlePanel("Iris Comparison"),
  
  sidebarLayout(
    sidebarPanel(
      
      selectInput("x_var",
                  label = "Choose a value to compare",
                  choices = c("Sepal Length", "Sepal Width",
                              "Petal Length", "Petal Width"),
                  selected = "Sepal Length"),
      selectInput("y_var",
                  label = "Choose a value to compare",
                  choices = c("Sepal Length", "Sepal Width",
                              "Petal Length", "Petal Width"),
                  selected = "Sepal Width")
      
    ),
    
    mainPanel(
      
      plotOutput("compare"),
      
      plotOutput("Petal_W"),
      
      plotOutput("Petal_L")
      
    )
  )
)



# Define server tags ----

server <- function(input, output) {
  
  output$compare <- renderPlot({
    data_x <- switch(input$x_var,
                   "Sepal Length" = iris$Sepal.Length,
                   "Sepal Width" = iris$Sepal.Width,
                   "Petal Length" = iris$Petal.Length,
                   "Petal Width" = iris$Petal.Width)
    
    data_y <- switch(input$y_var,
                    "Sepal Length" = iris$Sepal.Length,
                    "Sepal Width" = iris$Sepal.Width,
                    "Petal Length" = iris$Petal.Length,
                    "Petal Width" = iris$Petal.Width)
    
    legend_x <- switch(input$x_var,
                     "Sepal Length" = "Sepal Length",
                     "Sepal Width" = "Sepal Width",
                     "Petal Length" = "Petal Length",
                     "Petal Width" = "Petal Width")
    
    legend_y <- switch(input$y_var,
                      "Sepal Length" = "Sepal Length",
                      "Sepal Width" = "Sepal Width",
                      "Petal Length" = "Petal Length",
                      "Petal Width" = "Petal Width")
  
    plot(
      x = data_x,
      y = data_y,
      xlab = legend_x,
      ylab = legend_y
      
    )
    
  })
  
  output$Petal_W <- renderPlot({
    
    plot(
      iris$Petal.Width,
      iris$Species,
      xlab = "Petal Width",
      ylab = "Species"
      )
    
  })
  
  output$Petal_L <- renderPlot({
    
    plot(
      iris$Petal.Length,
      iris$Species,
      xlab = "Petal Length",
      ylab = "Species"
      )
    
  })
  
}



#Run the app ----

shinyApp(ui = ui, server = server)
