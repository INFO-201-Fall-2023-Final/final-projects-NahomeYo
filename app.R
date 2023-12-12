<<<<<<< HEAD
# URL to app
# https://ub8ewi-nahome-yohannes.shinyapps.io/INFO201BE8FINALPROJECT/
=======
#URL of website
#https://ub8ewi-nahome-yohannes.shinyapps.io/INFO201GroupBE-8FinalProject/
>>>>>>> 2612b5c864875ac2eb546d5a3a5c53dbaee835f8

library(shiny)
library(ggplot2)
library(dplyr)

povertyCasualties <- read.csv("df.csv")
correlation <- read.csv("summarize_df.csv")

ui <- navbarPage(
<<<<<<< HEAD
  tags$head(
    tags$style(HTML("
      .navbar li:active,
      .navbar li:hover {
        font-weight: bold;
        background-color: #9ecce8;
        box-shadow: 1px 1px 2px #000;
      }
    "))
  ),
  title = "Israel-Palestine Conflict Analysis: INFO 201 Group BE-8",
  tabPanel("Introduction", 
           fluidPage(
             titlePanel(
               h1("Introduction to our exploration through this conflict", style = 'color: white; font-weight: bold;'),
             ),
             h2("◘ What is the focus of this app/analysis?", style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 18px;"),  
             p("This app centers on the prolonged conflict between Israel and Palestine, particularly in the West Bank and Gaza. The objective is to unravel the underlying drivers of the conflict, with a specific emphasis on indicators related to poverty and mortality rates.",
               style = "color: #e3f2ff; text-align: left;"),  
             h2("◘ Why is understanding this conflict important?", style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 18px;"),  
             p("Understanding this conflict is crucial due to its decades-long history and broader implications. The analysis sheds light on the social, economic, and violent dimensions, particularly the human cost associated with poverty and mortality. This comprehension is essential for informed discussions and decisions surrounding the Israel-Palestine dispute.",
=======
  title = tags$h1("Unraveling Links in the Israel-Palestine Conflict (Nahome Yohannes and Malika Ali INFO 201 BE-8)", 
                  style = "text-align: topLeft; font-weight: 800; font-size: 20px; text-shadow: 2px 2px 4px #000; color: white"),  
  tabPanel("🇮🇱Introduction🇵🇸", 
           fluidPage(
             titlePanel(
               HTML("<h2 style='color: white; font-weight: bold;'>Introduction to our exploration through this conflict...</h2>")
             ),
             h2("◘ What is the focus on this app/analysis?", style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 18px;"),  
             p("This app centers on the prolonged conflict between Israel and Palestine, particularly in the West Bank and Gaza. The objective is to unravel the underlying drivers of the conflict, with a specific emphasis on indicators related to poverty and mortality rates.",
               style = "color: #e3f2ff; text-align: left;"),  
             h2("◘ Why is understanding this conflict important?", style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 18px;"),  
             p("Understanding this conflict is important due to its decades-long history and broader implications. The analysis sheds light on the social, economic, and violent dimensions, particularly the human cost associated with poverty and mortality. This comprehension is crucial for informed discussions and decisions surrounding the Israel-Palestine dispute.",
>>>>>>> 2612b5c864875ac2eb546d5a3a5c53dbaee835f8
               style = "color: #e3f2ff; text-align: left;"),  
             h2("◘ What dataset is being used for the analysis, and how is data wrangling implemented?", style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 18px;"), 
             p("The primary dataset for this analysis is the Nutrition Label, which comprehensively covers the ongoing Israel-Palestine conflict. To enhance the analysis, data wrangling is employed, specifically focusing on West Gaza's poverty and casualties rates.",
               style = "color: #e3f2ff; text-align: left;"),  
             p("📄 The following links present the original datasets, which have been merged and wrangled to construct the primary dataset.",
               style = "color: #e3f2ff; text-align: left; font-style: italic; font-weight: 600; font-size: 18px;"),
             p("https://uwnetid-my.sharepoint.com/:x:/g/personal/nyohan_uw_edu/Ec0rbDyo4jZDpQhRBpb460YBaXXZauZ1pu-H2UTNB-OHCA?e=L3Pcwj",
               style = "color: #e3f2ff; text-align: left; font-style: italic;"),
             p("https://uwnetid-my.sharepoint.com/:x:/g/personal/nyohan_uw_edu/ESnrtAwGPb1Onb_FhJHTN7MBB51khw0SfjMMbLOaXr8I0w?e=MB91pg",
               style = "color: #e3f2ff; text-align: left; font-style: italic;"),
<<<<<<< HEAD
             imageOutput("IsraelFlag"),
             imageOutput("PalestineFlag"),
           ),
           style = "background-color: #c42943;"
  ),
  tabPanel("Poverty Observation",
           fluidPage(
             titlePanel(
               h1("West Bank and Gaza 💔Poverty Levels💰 Through the Years...", style = 'color: white; font-weight: bold;'),
             ),
             h2("◘ What is the story?", style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 18px;"),
             p("This tab focuses on observing and analyzing poverty levels in the West Bank and Gaza over the years. It explores how poverty has changed and its potential impact on the conflict dynamics, specifically in terms of casualties. The analysis aims to uncover patterns and insights into the relationship between poverty and the human cost in the region.",
               style = "color: #e3f2ff; text-align: left;"),
             h2("◘ How do I interact with this data?", style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 18px;"),
             p("Interact with the data by adjusting the slider input labeled 'Select Year Range' in the sidebar. This allows you to explore poverty levels in the West Bank and Gaza for specific years. The main panel displays a dynamic plot illustrating the frequency of the various poverty levels for each year. The primary dataset on the right will filter, showing the particular levels and poverty instances of the years selected on the slider.",
=======
           ),
           style = "background-color: #0087ff; height: 100vh; width: 100vw;"  
  ),
  tabPanel("🇮🇱Poverty Observation🇵🇸",
           fluidPage(
             titlePanel(
               HTML("<h2 style='color: white; font-weight: bold;'>West Bank and Gaza 💔Poverty Levels💰 Through the Years...</h2>")
             ),
             
             h2("◘ What is the story?", style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 18px;"),
             p("This tab focuses on observing and analyzing poverty levels in the West Bank and Gaza over the years. It explores how poverty has changed and its potential impact on the conflict dynamics, specifically in terms of casualties. The analysis aims to uncover patterns and insights into the relationship between poverty and the human cost in the region.",
               style = "color: #e3f2ff; text-align: left;"),
             
             h2("◘ How do I interact with this data?", style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 18px;"),
             p("Interact with the data by adjusting the slider input labeled 'Select Year Range' in the sidebar. This allows you to explore poverty levels in the West Bank and Gaza for specific years. The main panel displays a dynamic plot illustrating the relationship between the selected year range and the levels of poverty, providing valuable insights into the patterns and trends over time.",
>>>>>>> 2612b5c864875ac2eb546d5a3a5c53dbaee835f8
               style = "color: #e3f2ff; text-align: left;"),
             
             sidebarLayout(
               sidebarPanel(
                 sliderInput("year_range", label = "Select Year Range",
<<<<<<< HEAD
                             min = min(povertyCasualties$Year),
                             max = max(povertyCasualties$Year),
                             value = c(min(povertyCasualties$Year), max(povertyCasualties$Year)),
=======
                             min = min(povertyCasualities$Year),
                             max = max(povertyCasualities$Year),
                             value = c(min(povertyCasualities$Year), max(povertyCasualities$Year)),
>>>>>>> 2612b5c864875ac2eb546d5a3a5c53dbaee835f8
                             step = 1),
                 plotOutput("area_plot_poverty")
               ),
               mainPanel(
                 tableOutput("year_table_poverty")
               )
             )
           ),
<<<<<<< HEAD
           style = "background-color: #2a733b;"
  ),
  tabPanel("Causalities Observation",
           fluidPage(
             titlePanel(
               h1("West Bank and Gaza 💀Casualties💀 Through the Years...", style = 'color: white; font-weight: bold;'),
             ),
             h2("◘ What is the story?", style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 18px;"),
             p("This tab delves into the observation of casualties in the West Bank and Gaza over the years. It aims to understand the trends and patterns in casualties and their potential correlation with socio-economic conditions, especially poverty levels. The analysis provides insights into the human cost of the conflict and its relationship with poverty indicators.",
               style = "color: #e3f2ff; text-align: left;"),
             h2("◘ How do I interact with this data?", style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 18px;"),
             p("Interact with the data by adjusting the slider input labeled 'Select Year Range' in the sidebar. This allows you to explore casualties in the West Bank and Gaza for specific years. The main panel displays a dynamic plot illustrating the frequency of total casualties for each year. The primary dataset on the right will filter, showing the particular casualties and instances of the years selected on the slider.",
               style = "color: #e3f2ff; text-align: left;"),
             
             
             sidebarLayout(
               sidebarPanel(
                 sliderInput("year_range", label = "Select Year Range",
                             min = min(povertyCasualties$Year),
                             max = max(povertyCasualties$Year),
                             value = c(min(povertyCasualties$Year), max(povertyCasualties$Year)),
=======
           style = "background-color: #FF0000; height: 100%; width: 100%;"  
  ),
  tabPanel("🇮🇱Causalities Observation🇵🇸",
           fluidPage(
             titlePanel(
               HTML("<h2 style='color: white; font-weight: bold;'>West Bank and Gaza 💀Casualties💀 Through the Years...</h2>")
             ),
             
             h2("◘ What is the story?", style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 18px;"),
             p("This tab delves into the observation of casualties in the West Bank and Gaza over the years. It aims to understand the trends and patterns in casualties and their potential correlation with socio-economic conditions, especially poverty levels. The analysis provides insights into the human cost of the conflict and its relationship with poverty indicators.",
               style = "color: #e3f2ff; text-align: left;"),
             
             h2("◘ How do I interact with this data?", style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 18px;"),
             p("Interact with the data by selecting a specific poverty level from the dropdown menu labeled 'Select Poverty Level' in the sidebar. This allows you to explore the correlation between poverty levels and casualties in the West Bank and Gaza. The main panel displays a bar plot illustrating the average total casualties for each year, with color coding indicating the most frequent poverty level. This visualization provides insights into the potential relationship between socio-economic conditions and casualties.",
               style = "color: #e3f2ff; text-align: left;"),
             
             sidebarLayout(
               sidebarPanel(
                 sliderInput("year_range_causalities", label = "Select Year Range",
                             min = min(povertyCasualities$Year),
                             max = max(povertyCasualities$Year),
                             value = c(min(povertyCasualities$Year), max(povertyCasualities$Year)),
>>>>>>> 2612b5c864875ac2eb546d5a3a5c53dbaee835f8
                             step = 1),
                 plotOutput("area_plot_causalities")
               ),
               mainPanel(
<<<<<<< HEAD
                 tableOutput("year_table_casualities")
               )
             )
           ),
           style = "background-color: #4490c9;"
  ),
  tabPanel("Correlation",
           fluidPage(
             titlePanel(
               h1("West Bank and Gaza 💰Poverty/Casualties💀 Through the Years...", style = 'color: white; font-weight: bold;'),
             ),
             h2("◘ What is the story?", style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 18px;"),
             p("This tab explores the correlation between poverty levels and casualties in the West Bank and Gaza over the years. It investigates whether there is a direct relationship between socio-economic conditions, represented by poverty indicators, and the human cost of the conflict. The analysis aims to uncover insights into the potential impact of poverty on casualties in the region.",
               style = "color: #e3f2ff; text-align: left;"),
=======
                 tableOutput("year_table_causalities")
               )
             )
           ),
           style = "background-color: #0087ff; height: 100%; width: 100%;" 
  ),
  tabPanel("🇮🇱Correlation🇵🇸",
           fluidPage(
             titlePanel(
               HTML("<h2 style='color: white; font-weight: bold;'>West Bank and Gaza 💰Poverty/Casualties💀 Through the Years...</h2>")
             ),
             
             h2("◘ What is the story?", style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 18px;"),
             p("This tab explores the correlation between poverty levels and casualties in the West Bank and Gaza over the years. It investigates whether there is a direct relationship between socio-economic conditions, represented by poverty indicators, and the human cost of the conflict. The analysis aims to uncover insights into the potential impact of poverty on casualties in the region.",
               style = "color: #e3f2ff; text-align: left;"),
             
>>>>>>> 2612b5c864875ac2eb546d5a3a5c53dbaee835f8
             h2("◘ How do I interact with this data?", style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 18px;"),
             p("Interact with the data by selecting a specific poverty level from the dropdown menu labeled 'Select Poverty Level' in the sidebar. This allows you to explore the correlation between poverty levels and casualties in the West Bank and Gaza. The main panel displays a bar plot illustrating the average total casualties for the selected poverty level, providing insights into the potential relationship between socio-economic conditions and casualties.",
               style = "color: #e3f2ff; text-align: left;"),
             
<<<<<<< HEAD
             
=======
>>>>>>> 2612b5c864875ac2eb546d5a3a5c53dbaee835f8
             sidebarLayout(
               sidebarPanel(
                 selectInput("selected_poverty", label = "Select Poverty Level",
                             choices = c("all", levels(factor(correlation$Poverty_Level))))
               ),
               mainPanel(
                 plotOutput("correlation_plot"),
                 h2("◘ Conclusions and Takeaways", style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 18px;"),
                 p("Analyzing data from 2002 to 2020 in West Gaza reveals a noticeable correlation between poverty levels and casualties. However, anomalies, like the unexpected drop in casualties during 2010 despite high poverty, suggest a more nuanced relationship. The year 2014 stands out with a significant spike in both medium poverty and casualties. While a general trend shows high poverty aligning with increased casualties, the presence of outliers emphasizes the need for a closer look at the causal link between poverty and death rates in this region.",
                   style = "color: #e3f2ff; text-align: left;"),
               )
<<<<<<< HEAD
             ),
             style = "background-color: #c42943;"
           )
=======
             )
           ),
           style = "background-color: #FF0000; height: 200%; width: 100%;" 
>>>>>>> 2612b5c864875ac2eb546d5a3a5c53dbaee835f8
  )
)

server <- function(input, output) {
<<<<<<< HEAD
  output$IsraelFlag <- renderImage({
    list(src = "www/IsraelFlag.png",
         width = "50%",
         height = "100%",
         align = "center")  
  }, deleteFile = FALSE)
  
  output$PalestineFlag <- renderImage({
    list(src = "www/PalestineFlag.png",
         width = "50%",
         height = "100%",
         align = "center") 
  }, deleteFile = FALSE)
  
  output$year_table_poverty <- renderTable({
    data_table <- filter(select(povertyCasualities, -Value, -Month, -Palestinians.Killed, -Israelis.Killed, -Total_Killed), Year >= input$year_range[1] & Year <= input$year_range[2])
    data_table
  })
  
  output$year_table_casualities <- renderTable({
    data_table <- filter(select(povertyCasualities, -Value, -Month, -Indicator.Name), Year >= input$year_range[1] & Year <= input$year_range[2])
=======
  output$year_table_poverty <- renderTable({
    data_table <- filter(select(povertyCasualties, -Value, -Month, -Palestinians.Killed, -Israelis.Killed, -Total_Killed), Year >= input$year_range[1] & Year <= input$year_range[2])
>>>>>>> 2612b5c864875ac2eb546d5a3a5c53dbaee835f8
    data_table
  })
  
  output$area_plot_poverty <- renderPlot({
    data_plot <- povertyCasualties[povertyCasualties$Year >= input$year_range[1] & povertyCasualties$Year <= input$year_range[2], ]
    
<<<<<<< HEAD
    ggplot(data_plot, aes(x = Year, y = Poverty_Level, color = Poverty_Level)) +
      geom_point() +
      labs(title = "Poverty Levels Over the Years",
           x = "Year", y = "Poverty Levels")
  })
  
  output$area_plot_causalities <- renderPlot({
    data_plot <- povertyCasualties[povertyCasualties$Year >= input$year_range[1] & povertyCasualties$Year <= input$year_range[2], ]
    
    ggplot(data_plot, aes(x = Year, y = Total_Killed, color = Total_Killed)) +
      geom_point() +
      labs(title = "Causalities Over the Years",
=======
    ggplot(data_plot, aes(x = Year, y = Total_Killed, color = Total_Killed)) +
      geom_point() +
      labs(title = "Poverty Levels Over Years",
           x = "Year", y = "Total Killed")
  })
  
  output$year_table_causalities <- renderTable({
    data_table <- filter(select(povertyCasualties, -Value, -Month, -Palestinians.Killed, -Israelis.Killed, -Poverty_Level), Year >= input$year_range_causalities[1] & Year <= input$year_range_causalities[2])
    data_table
  })
  
  output$area_plot_causalities <- renderPlot({
    data_plot <- povertyCasualties[povertyCasualties$Year >= input$year_range_causalities[1] & povertyCasualties$Year <= input$year_range_causalities[2], ]
    
    ggplot(data_plot, aes(x = Year, y = Total_Killed, color = Total_Killed)) +
      geom_point() +
      labs(title = "Causalities Levels Over Years",
>>>>>>> 2612b5c864875ac2eb546d5a3a5c53dbaee835f8
           x = "Year", y = "Total Killed")
  })
  
  output$correlation_plot <- renderPlot({
    if (input$selected_poverty == "all") {
      selected_poverty_data <- correlation
    } else {
      selected_poverty_data <- correlation[correlation$Poverty_Level == input$selected_poverty, ]
    }
    
    ggplot(selected_poverty_data, aes(x = as.character(Year), y = Average_Total_Killed, fill = Poverty_Level)) +
      geom_bar(stat = "identity", position = "dodge") +
      scale_fill_manual(values = c("low_poverty" = "red", "medium_poverty" = "yellow", "high_poverty" = "green")) +
      labs(title = paste("Causalities Data Visualization - ", input$selected_poverty),
           x = "Year", y = "Average Total Killed")
  })
}

shinyApp(ui = ui, server = server)