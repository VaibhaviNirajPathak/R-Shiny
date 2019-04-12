pheno <-read.csv("Phenotype.csv",header = T)

ui<- fluidPage(
  titlePanel("Cattle Phenotype DATA"),
  sidebarPanel(
    numericInput('NoofTraits','Please select No of Traits',4),
    numericInput('Score','Please select min score',5)
  ),
  
  mainPanel(
    #verbatimTextOutput("summary"),
    textOutput("top")
  )
)

server <- function(input,output,session)
{
  
  p <- reactive ({
    ntraits <- input$NoofTraits
    score <- input$Score
    
    
    find_top <- function(score, ntraits)
    {
      use_df <- sapply(pheno[,2:ncol(pheno)],function(x){ y <- score:10;match(x, y)})
      tidy_df <-cbind(pheno$SampleID, use_df)
      tidy_df <- as.data.frame(tidy_df,stringsAsFactors = F)
      NA_df_filter <- rowSums(is.na(tidy_df))
      names(NA_df_filter) <- 1:nrow(pheno)
      index_no <<-names(NA_df_filter[NA_df_filter <= (ncol(pheno)-1)-ntraits])
      tidy_df[index_no,1]
    }
    
  })
  output$top <- renderText({find_top(input$Score,input$NoofTraits)})
  
}

shinyApp(ui,server) 
