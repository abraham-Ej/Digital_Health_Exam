library(shiny)
library(shinydashboard)


## Shiny UI component for the Dashboard

dashboardPage(
  dashboardHeader(title="Exploring the impact of crime to Global Public Health in the USA with R & Shiny Dashboard", titleWidth = 850,
                  tags$li(class="dropdown",tags$a(href="https://www.linkedin.com/in/abraham-osayande-4747a3a9/" ,icon("linkedin"), "My Profile", target="_blank")),
                  tags$li(class="dropdown",tags$a(href="https://github.com/abraham-Ej/Digital_Health_Exam.git", icon("github"), "Source Code", target="_blank"))
  ),
  dashboardSidebar(
    
    # sidebarmenu
    
    sidebarMenu(
      id = "sidebar",
      
      #first menuitem
      menuItem("Dataset", tabName = "data", icon = icon("database")),
      menuItem(text = "Visualization", tabName = "viz",icon = icon("chart-line")),
      selectInput(inputId = "var1" , label = "select the variable" , choices = c1, selected = "Rape"),
      selectInput(inputId = "var3" , label = "select X variable" , choices = c1, selected = "Rape"),
      selectInput(inputId = "var4" , label = "select Y variable" , choices = c1, selected = "Assualt")
    )
  ),
  dashboardBody(
    tabItems(
      #First tab item
      tabItem(tabName = "data",
              # tab box
              tabBox(id = "t1", width = 12,
                     tabPanel("About" , icon = icon("address-card"), fluidRow(
                       column(width = 8, tags$img(src="crime1.PNG", width = 400, height = 200),
                              tags$br(),
                              tags$a("photo by Gianpsolo Parise "), align = "center"),
                       column(width = 4, tags$br(),
                              tags$p("crime can have significant effects on the public health of a nation. High crime rates can contribute to physical and mental health issues for individuals, create a sense of insecurity, and strain healthcare resources. Additionally, violence and criminal activities may lead to injuries, trauma, and increased stress within communities, impacting overall well-being. Addressing crime often involves a multi-faceted approach that considers both law enforcement and public health strategies."))
                     )),
                     
                     tabPanel(title = "Data", icon = icon("address-card"),dataTableOutput("dataT") ),
                     tabPanel(title = "structure" , icon = icon("address-card"),verbatimTextOutput("structure")),
                     tabPanel(title = "summary stats", icon = icon("address-card"), verbatimTextOutput("summary"))
                     )
              ),
      # second tab item
      tabItem(tabName = "viz",
              tabBox(id="t2", width = 12,
                     #tabPanel(title = "Crime Trends by state", value = "trends", h4("tabpanel-1 UI")),
                     tabPanel(title= "Distribution" , value = "distro", plotlyOutput("histplot")),
                     #tabPanel(title = "Correlation Matrix", h4("tabpanel-3 UI")),
                     tabPanel(title = "Relationship among arrest types & urban population", value = "relation", 
                             radioButtons(inputId = "fit", label = "select smooth method" , choices = c("loess", "lm"), selected = "lm", inline = TRUE),
                              plotlyOutput("scatter"))
                     ))
    )
  )
)

