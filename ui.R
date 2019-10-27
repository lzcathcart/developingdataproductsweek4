library(shiny)
library(ggplot2)

# Load  and clean data
data("midwest")

# Define UI for the application
shinyUI(fluidPage(
        titlePanel("Diversity in Indiana by County"),
        
        # Generate a row with a sidebar
        sidebarLayout(      
                
                # Define the sidebar with one input
                sidebarPanel(
                        selectInput(
                                inputId = "County",
                                label = "County",
                                choices = indianaagain$County,
                                multiple = F,
                                selected = indianaagain$County[1]
                        ),
                        
                        # include a reactive element
                        actionButton("goButton", label = "Go!"),
                        
                        # where the dataset was found
                        hr(),
                        helpText("Demographic Information from Midwest Dataset.")
                ),

                mainPanel(
                        plotOutput("indianaPlot")
                )
        ))
)
