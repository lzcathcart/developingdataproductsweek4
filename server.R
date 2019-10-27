# Define server logic required to draw a histogram
server <- function(input, output) {
    
    #go button
    
    output$indianaPlot <- renderPlot({
        
        input$goButton
            
            isolate({
                    (input$County)
            
        
        indiana <- subset(midwest, midwest$state == "IN")
        indiana[,2] <- lapply(indiana[,2], as.factor)
        
        indianaagain <- cbind.data.frame(indiana[,2], indiana[,7:11])
        colnames(indianaagain) <- c("County", "White", "Black", "American Indian", "Asian", "Other")
        
        indianaagain <- subset(indianaagain, indianaagain$County %in% input$County)
         
              
        s1 <- data.frame(NULL)
        for(i in 1:5){
            s1[i,1] <- sum(indianaagain[,(i+1)], na.rm = T)
        }
        s1 <- cbind(c("White", "Black", "American Indian", "Asian", "Other"), s1)
        colnames(s1) <- c("Variable", "Output")
        
        indianaPlot <- ggplot(s1, aes(x=Variable, y=Output, fill=Variable)) + 
            geom_bar(stat="identity", position="dodge")
        indianaPlot + labs(x = "Race", y = "Population") +
            scale_fill_discrete(name = "Legend")
       
            })  
    }
            )}

