# USAarrest Dataset

library(dplyr)
library(plotly)
library(ggplot2)
library(ggtext) 

?USArrests

#create data object
my_data <-USArrests

# structure of the data
my_data %>%
  str()

# Summary
my_data %>%
  summary()

# first few observations
my_data %>%
  head()

# Assigning row names to object
states = rownames(my_data)

my_data = my_data %>%
  mutate(states=states)

str(my_data)

# Second menuitem visualization
# creating histogram and boxplot for distribution

#p1 = my_data %>%
 #plot_ly() %>%
  #add_histogram(~get(input$var1)) %>%
  #layout(xaxis = list(title =input$var1))

# box plot
#p2 = my_data %>%
 #plot_ly() %>%
  #add_boxplot(~get(input$var1)) %>%
  #layout(yaxis = list(showticklabels = F))

# stacking plots
#subplot(p2, p1, nrows = 2) %>%
 #hide_legend() %>%
  #layout(title = "Distribution chart - Histogram and Boxplot",
   #  yaxis = list(title="Freqency"))

# choices for selectinput - without state column
c1 = my_data %>%
 select(-states)  %>%
 names()


# creating scatter plot for relationship using ggplot

#my_data %>%
 # ggplot(aes(x=get(input$var3), y=get(input$var4))) +
  #geom_point() +
  #geom_smooth(method = "lm") +
  #labs(title = paste("Relation b/w", input$var3, "and", input$var4),
   #    x = input$var3,
    #   y = input$var4) +
  #theme(plot.title = element_textbox_simple(size = 10,
   #                                         halign = 0.5))

