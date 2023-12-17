# URL to app
# https://ub8ewi-nahome-yohannes.shinyapps.io/INFO201BEFINALPROJECT/

library(shiny)
library(ggplot2)
library(dplyr)

povertyCasualties <- read.csv("df.csv")
correlation <- read.csv("summarize_df.csv")

ui <- navbarPage(
  tags$head(tags$style(
    HTML(
      '
      .navbar li:hover {
        font-weight: bold;
        background-color: #ff5252;
        box-shadow: 1px 1px 2px #000;
      }
      body {
        background-color: #0a2a4d;
      }
    '
    )
  )),
  
  title = "Israel-Palestine Conflict Analysis: INFO 201 Group BE-8",
  tabPanel(
    "Introduction",
    fluidPage(
      fluidRow(
        column(4, imageOutput("IsraelFlag")),
        column(4, titlePanel(
          h1("Introduction to our exploration through this conflict", style = 'color: white; font-weight: bold; text-align: center; font-size: 60px')
        )),
        column(4, imageOutput("PalestineFlag"))
      ),
      h2("◘ What is the focus of this app/analysis?", style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 40px;"),
      p(
        "This app delves into the enduring Israel-Palestine conflict, with a focus on the West Bank and Gaza and their significance from 2002 to 2020. The West Bank is primarily inhabited by Palestinians and holds key religious sites, while the presence of Israeli settlements has fueled land and border disputes. In Gaza, controlled by Hamas and facing economic challenges due to an Israeli-Egyptian blockade, there are high poverty and mortality rates. The historical, religious, and geopolitical dimensions of these regions contribute to the complexity of the conflict. Understanding these dynamics is crucial for unraveling the roots of the conflict between Israelis and Palestinians from 2002 to 2020 and exploring sustainable solutions.",
        style = "color: #e3f2ff; text-align: left; font-size: 25px;"
      ),
      imageOutput("WestBankGaza"),
      br(),
      h2("◘ Why is understanding this conflict important?", style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 40px;"),
      p(
        "Understanding this conflict between Palestine and Israel begins with acknowledging its longstanding nature, impacting a multitude of people and persisting to this very day. Delving into the details is essential for fostering meaningful discussions and making informed decisions regarding the issues between Palestine and Israel. Moreover, it enables us to perceive the intricate connections among politics, economics, and violence. This analysis will focus on identifying common factors, such as poverty and casualties. Through a proactive examination of the prevalence of poverty and trends in casualties, correlations between these issues can be discerned. This, in turn, allows for the formulation of comprehensive conclusions that world leaders can use as a basis for creating effective policies and strategies. Utilizing our analysis, they can directly address the root problems and devise enduring solutions. This understanding is pivotal not only for defending human rights but also for fostering empathy towards the challenges others face. It plays a crucial role in garnering international support, especially in light of the ongoing humanitarian emergency. Given the gravity of the situation, prompt action is imperative to find fair and permanent answers.",
        style = "color: #e3f2ff; text-align: left; font-size: 25px;"
      ),
      br(),
      h2(
        "◘ What dataset is being used for the analysis, and how is data wrangling implemented?",
        style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 40px;"
      ),
      p(
        "The primary dataset for this dataset “df”, located in our github repository (https://github.com/INFO-201-Fall-2023-Final/final-projects-NahomeYo/blob/main/df.csv), which comprehensively covers the ongoing Israel-Palestine conflict from the past decades, from 2002 to 2020. Data wrangling was employed, specifically focusing on West Bank and Gaza's poverty and casualties rates. The dataset is 1716 rows and 9 columns, in which all the data accounts for the Yeas, the region of poverty and casualties, mostly West Bank and Gaza. Indicator/Causes of Poverty, the numerical value associated with the poverty indicators, the month, Number of Palestinians, Number of Israelis killed, The poverty level associated with the indicators and lastly, the total number of people among Israelis and Palestinians.",
        style = "color: #e3f2ff; text-align: left; font-size: 25px;"
      ),
      br(),
      p(
        "📄 The following links present the original datasets, which have been merged and wrangled to construct the primary dataset.",
        style = "color: #e3f2ff; text-align: left; font-style: italic; font-weight: 600; font-size: 35px;"
      ),
      p(
        "◘ https://uwnetid-my.sharepoint.com/:x:/g/personal/nyohan_uw_edu/Ec0rbDyo4jZDpQhRBpb460YBaXXZauZ1pu-H2UTNB-OHCA?e=L3Pcwj",
        style = "color: #e3f2ff; text-align: left; font-style: italic; font-size: 25px;"
      ),
      p(
        "◘ https://uwnetid-my.sharepoint.com/:x:/g/personal/nyohan_uw_edu/ESnrtAwGPb1Onb_FhJHTN7MBB51khw0SfjMMbLOaXr8I0w?e=MB91pg",
        style = "color: #e3f2ff; text-align: left; font-style: italic; font-size: 25px;"
      ),
    ),
    style = "background-color: #c42943;"
  ),
  tabPanel(
    "Poverty Observation",
    fluidPage(
      titlePanel(
        h1(
          "West Bank and Gaza 💔Poverty Levels💰 Through the Years...",
          style = 'color: white; font-weight: bold; font-size: 60px'
        ),
      ),
      h2("◘ What is the story?", style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 40px;"),
      p(
        "This tab focuses on observing and analyzing poverty levels in the West Bank and Gaza over the years. It explores how poverty has changed and its potential impact on the conflict dynamics, specifically in terms of casualties. The analysis aims to uncover patterns and insights into the relationship between poverty and the human cost in the region.",
        style = "color: #e3f2ff; text-align: left; font-size: 25px;"
      ),
      br(),
      h2("◘ How do I interact with this data?", style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 40px;"),
      p(
        "Interact with the data by adjusting the slider input labeled 'Select Year Range' in the sidebar. This allows you to explore poverty levels in the West Bank and Gaza for specific years. The main panel displays a dynamic plot illustrating the frequency of the various poverty levels for each year. The primary dataset on the right will filter, showing the particular levels and poverty instances of the years selected on the slider.",
        style = "color: #e3f2ff; text-align: left; font-size: 25px;"
      ),
      
      sidebarLayout(
        sidebarPanel(
          sliderInput(
            "year_range_poverty",
            label = "Select Year Range",
            min = min(povertyCasualties$Year),
            max = max(povertyCasualties$Year),
            value = c(min(povertyCasualties$Year), max(povertyCasualties$Year)),
            step = 1
          ),
          plotOutput("area_plot_poverty")
        ),
        mainPanel(tableOutput("year_table_poverty"))
      )
    ),
    style = "background-color: #2a733b;"
  ),
  tabPanel(
    "Causalities Observation",
    fluidPage(
      titlePanel(
        h1("West Bank and Gaza 💀Casualties💀 Through the Years...", style = 'color: white; font-weight: bold; font-size: 60px'),
      ),
      h2("◘ What is the story?", style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 40px;"),
      p(
        "This tab delves into the observation of casualties in the West Bank and Gaza over the years. It aims to understand the trends and patterns in casualties and their potential correlation with socio-economic conditions, especially poverty levels. The analysis provides insights into the human cost of the conflict and its relationship with poverty indicators.",
        style = "color: #e3f2ff; text-align: left; font-size: 25px"
      ),
      br(),
      h2("◘ How do I interact with this data?", style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 40px;"),
      p(
        "Interact with the data by adjusting the slider input labeled 'Select Year Range' in the sidebar. This allows you to explore casualties in the West Bank and Gaza for specific years. The main panel displays a dynamic plot illustrating the frequency of total casualties for each year. The primary dataset on the right will filter, showing the particular casualties and instances of the years selected on the slider.",
        style = "color: #e3f2ff; text-align: left; font-size: 25px"
      ),
      
      
      sidebarLayout(
        sidebarPanel(
          sliderInput(
            "year_range_casualities",
            label = "Select Year Range",
            min = min(povertyCasualties$Year),
            max = max(povertyCasualties$Year),
            value = c(min(povertyCasualties$Year), max(povertyCasualties$Year)),
            step = 1
          ),
          plotOutput("area_plot_causalities")
        ),
        mainPanel(tableOutput("year_table_casualities"))
      )
    ),
    style = "background-color: #4490c9;"
  ),
  tabPanel(
    "Correlation",
    fluidPage(
      titlePanel(
        h1(
          "West Bank and Gaza 💰Poverty/Casualties💀 Through the Years...",
          style = 'color: white; font-weight: bold; font-size: 60px'
        ),
      ),
      h2("◘ What is the story?", style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 40px;"),
      p(
        "This tab explores the correlation between poverty levels and casualties in the West Bank and Gaza over the years. It investigates whether there is a direct relationship between socio-economic conditions, represented by poverty indicators, and the human cost of the conflict. The analysis aims to uncover insights into the potential impact of poverty on casualties in the region.",
        style = "color: #e3f2ff; text-align: left; font-size: 25px"
      ),
      br(),
      h2("◘ How do I interact with this data?", style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 40px;"),
      p(
        "Interact with the data by selecting a specific poverty level from the dropdown menu labeled 'Select Poverty Level' in the sidebar. This allows you to explore the correlation between poverty levels and casualties in the West Bank and Gaza. The main panel displays a bar plot illustrating the average total casualties for the selected poverty level, providing insights into the potential relationship between socio-economic conditions and casualties.",
        style = "color: #e3f2ff; text-align: left; font-size: 25px"
      ),
      
      
      sidebarLayout(sidebarPanel(
        selectInput(
          "selected_poverty",
          label = "Select Poverty Level",
          choices = c("all", levels(factor(
            correlation$Poverty_Level
          )))
        )
      ),
      mainPanel(
        plotOutput("correlation_plot"),
        h2("◘ Conclusions and Takeaways", style = "color: #def0ff; font-weight: bold; text-align: left; font-size: 40px;"),
        p(
          "In conclusion, the analysis of data spanning from 2002 to 2020 in West Bank and Gaza reveals a discernible correlation between poverty levels and casualties. While a general trend suggests that higher poverty levels align with increased casualties, anomalies such as the unexpected drop in casualties during 2010 and the significant spike in both medium poverty and casualties in 2014 underscore the complexity of this relationship. The presence of outliers emphasizes the necessity of a more nuanced examination to understand the causal link between poverty and death rates in the region. This analysis calls for a comprehensive exploration of additional factors and contextual dynamics that may influence the observed patterns, ensuring a more accurate understanding of the interplay between poverty and casualty rates in West Bank and Gaza.",
          style = "color: #e3f2ff; text-align: left; font-size: 25px;"
        ),
      )),
      style = "background-color: #c42943;"
    )
  )
)

server <- function(input, output) {
  output$IsraelFlag <- renderImage({
    list(
      src = "www/IsraelFlag.png",
      width = "50%",
      height = "50%",
      align = "left"
    )
  }, deleteFile = FALSE)
  
  output$PalestineFlag <- renderImage({
    list(
      src = "www/PalestineFlag.png",
      width = "50%",
      height = "50%",
      align = "right"
    )
  }, deleteFile = FALSE)
  
  output$WestBankGaza <- renderImage({
    list(
      src = "www/map.png",
      width = "20%",
      height = "100%",
      align = "center"
    )
  }, deleteFile = FALSE)
  
  output$year_table_poverty <- renderTable({
    data_table <-
      filter(
        select(
          povertyCasualties,
          -Value,
          -Month,
          -Palestinians.Killed,
          -Israelis.Killed,
          -Total_Killed
        ),
        Year >= input$year_range_poverty[1] &
          Year <= input$year_range_poverty[2]
      )
    data_table
  })
  
  output$year_table_casualities <- renderTable({
    data_table <-
      filter(
        select(povertyCasualties,-Value,-Month,-Indicator.Name),
        Year >= input$year_range_casualities[1] &
          Year <= input$year_range_casualities[2]
      )
    data_table
  })
  
  output$area_plot_poverty <- renderPlot({
    data_plot <-
      povertyCasualties[povertyCasualties$Year >= input$year_range_poverty[1] &
                          povertyCasualties$Year <= input$year_range_poverty[2],]
    
    ggplot(data_plot,
           aes(x = Year, y = Poverty_Level, color = Poverty_Level)) +
      geom_point() +
      labs(title = "Poverty Levels Over the Years",
           x = "Year", y = "Poverty Levels")
  })
  
  output$area_plot_causalities <- renderPlot({
    data_plot <-
      povertyCasualties[povertyCasualties$Year >= input$year_range_casualities[1] &
                          povertyCasualties$Year <= input$year_range_casualities[2],]
    
    ggplot(data_plot,
           aes(x = Year, y = Total_Killed, color = Total_Killed)) +
      geom_point() +
      labs(title = "Causalities Over the Years",
           x = "Year", y = "Total Killed")
  })
  
  output$correlation_plot <- renderPlot({
    if (input$selected_poverty == "all") {
      selected_poverty_data <- correlation
    } else {
      selected_poverty_data <-
        correlation[correlation$Poverty_Level == input$selected_poverty,]
    }
    
    ggplot(
      selected_poverty_data,
      aes(
        x = as.character(Year),
        y = Average_Total_Killed,
        fill = Poverty_Level
      )
    ) +
      geom_bar(stat = "identity", position = "dodge") +
      scale_fill_manual(
        values = c(
          "low_poverty" = "red",
          "medium_poverty" = "yellow",
          "high_poverty" = "green"
        )
      ) +
      labs(
        title = paste("Causalities Data Visualization - ", input$selected_poverty),
        x = "Year",
        y = "Average Total Killed"
      )
  })
}

shinyApp(ui = ui, server = server)