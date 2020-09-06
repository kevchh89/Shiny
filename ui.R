library(shiny) 

shinyUI(fluidPage( 
  titlePanel("Visualize Many Models"),
  sidebarLayout ( 
    sidebarPanel( 
      h3("Slope"),
      textOutput("slopeOut" ), 
      h3("Intercept"), 
      textOutput("intOut"),
      sliderInput('sliderX','pick minumum and maximum x values',0,10,value=c(0,10)),
      sliderInput('sliderY','pick minumum and maximum y values',0,50,value=c(0,50)),
      checkboxInput('show_xlab','Show/Hide X axis label',value=T),
      checkboxInput('show_ylab','Show/Hide X axis label',value=T)
    ), 
    mainPanel( 
      plotOutput("plot1", brush=brushOpts( 
        id="brush1" 
      )) 
    )
  )
))