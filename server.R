library(DT)
library(shiny)
library(plotly)
function(input, output){
  
  #structure
  output$structure <- renderPrint(
    # structure of the data
    my_data %>%
      str()
  )
  
  #Summary
  output$summary <- renderPrint(
    # Summary
    my_data %>%
      summary()
  )
  
  #DataTable
  output$dataT <- renderDataTable(
    my_data
  )
  
  #stacked histogram and boxplot
  output$histplot <- renderPlotly({
    
   p1 = my_data %>%
    plot_ly() %>%
     add_histogram(~get(input$var1)) %>%
     layout(xaxis = list(title =input$var1))
    
    # box plot
    p2 = my_data %>%
      plot_ly() %>%
      add_boxplot(~get(input$var1)) %>%
      layout(yaxis = list(showticklabels = F))
    
    # stacking plots
    subplot(p2, p1, nrows = 2) %>%
     hide_legend() %>%
      layout(title = "Distribution chart - Histogram and Boxplot",
           yaxis = list(title="Freqency"))
  
    
    
    
  })
  output$scatter <- renderPlotly({
  
  #creating scatter plot for relationship using ggplot
  
  p= my_data %>%
    ggplot(aes(x=get(input$var3), y=get(input$var4))) +
   geom_point() +
  geom_smooth(method = get(input$fit)) +
  labs(title = paste("Relation b/w", input$var3, "and", input$var4),
      x = input$var3,
    y = input$var4) +
  theme(plot.title = element_textbox_simple(size = 10,
                                          halign = 0.5))
  
  ggplotly(p)
  
  })
  
  
}
