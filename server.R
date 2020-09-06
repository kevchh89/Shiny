library(shiny) 
shinyServer(function(input, output){ 
  model<- reactive({ 
    thecars<-brushedPoints(mtcars,input$brush1,
                               xvar="wt",yvar="mpg")
    if(nrow(thecars)<2){
      return(NULL)
    }
    lm(mpg~wt,data=thecars)
  })
  output$slopeOut<-renderText({
    if(is.null(model())){
      "No Model Found"
    }else{
      model()[[1]][2]
    }
  })
  output$intOut<-renderText({
    if(is.null(model())){
      "No Model Found"
    }else{
      model()[[1]][1]
    }
  })
  output$plot1<-renderPlot({
    minX<-input$sliderX[1]
    maxX<-input$sliderX[2]
    minY<-input$sliderY[1]
    maxY<-input$sliderY[2]
    dataX<-mtcars$wt
    dataY<-mtcars$mpg
    xlab<-ifelse(input$show_xlab,'X Axis','')
    ylab<-ifelse(input$show_ylab,'Y Axis','')
    main<-ifelse(input$show_title,'Title','')
    plot(dataX,dataY,xlab="Weight",ylab= 'Miles per Galon',
         cex=1.5,pch=16,bty="n",col='gray',xlim = c(minX,maxX),ylim = c(minY,maxY))
    
    if(!is.null(model())){
      abline(model(),col='red',lwd=2)
    }
    
  })
})