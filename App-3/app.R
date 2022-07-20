install.packages("shiny")
install.packages("tidyverse")
install.packages("reshape2")
install.packages("ggplot2")
install.packages("lattice")
install.packages("hexbin")
library(shiny)
library(tidyverse)
library(reshape2)
library(ggplot2)
library(lattice)
library(hexbin)

housing <- read.csv("App-3/datasets/housing.csv", header = TRUE)

head(df)

house_count <- tapply(
  housing$households,
  housing$ocean_proximity,
  sum
)

print(house_count)

hexbinplot(
  x = population ~ households,
  data = housing,
  main = "A comparison between households and population",
  xlab = "Households",
  ylab = "Population"
)

#Define UI -----

ui <- fluidPage(
  
  titlePanel("Housing Comparison"),
  
  sidebarLayout(
    sidebarPanel(
      h3("A display of various housing data")
    ),
    mainPanel(
      
      plotOutput("oceanProx"),
      plotOutput("pophouse"),
      plotOutput("rooms")
      
    )
  )
  
)

server <- function(input, output) {
  
  output$oceanProx <- renderPlot(
    barplot(
      height = house_count,
      main = "Housing count sorted by distance to ocean",
      xlab = "Ocean Proximity",
      ylab = "Number of houses"
    )
  )
  
  output$pophouse <- renderPlot(
    hexbinplot(
      x = population ~ households,
      data = housing,
      main = "A comparison between households and population",
      xlab = "Households",
      ylab = "Population"
    )
  )
  
  output$rooms <- renderPlot(
    hexbinplot(
      x = total_rooms ~ total_bedrooms,
      data = housing,
      main = "A comparison between total rooms and total bedrooms",
      xlab = "Bedrooms",
      ylab = "Rooms"
    )
  )
  
}

shinyApp(ui = ui, server = server)
