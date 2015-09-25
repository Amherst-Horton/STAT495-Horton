library(shiny)
require(mosaic)
trellis.par.set(theme=theme.mosaic())
mtheme = theme.mosaic()
load("PROCESSED2015-09-20.Rda")
dssmall <- filter(ds, ! INSTNM %in% c("Calvin College", "Cornell College", "Hampshire College", "University Of Massachusetts Amherst"))
lwdval <- 2
mtheme$superpose.line$lwd <- lwdval + 1
spanval <- 0.4

shinyServer(function(input, output) {
  
  output$plot <- renderPlot({
    variable <- input$variable

    lwdval <- 3
    value <- input$additions
    if (value=="line") {
      typeval = c("p", "l")
    } else if (value=="smoother") {
      typeval = c("p", "smooth") 
    } 

    start <- input$startyear
    end <- input$endyear

    if (variable=="PCIP05") {
      xyplot(PCIP05 ~ year, group=INSTNM, xlim=c(start, end), type=typeval, span=spanval, auto.key=list(columns=2, lines=TRUE, points=TRUE), 
             lwd=lwdval, ylab="Proportion of graduates in Area Studies", par.settings = mtheme, data=dssmall)
    } else if (variable=="PCIP11") {
      xyplot(PCIP11 ~ year, group=INSTNM, xlim=c(start, end), type=typeval, span=spanval, auto.key=list(columns=2, lines=TRUE, points=TRUE), 
             lwd=lwdval, ylab="Proportion of graduates in Computer Science", par.settings = mtheme, data=dssmall)
    } else if (variable=="PCIP26") {
      xyplot(PCIP26 ~ year, group=INSTNM, xlim=c(start, end), type=typeval, span=spanval, auto.key=list(columns=2, lines=TRUE, points=TRUE), 
             lwd=lwdval, ylab="Proportion of graduates in Biological Science", par.settings = mtheme, data=dssmall)
    } else if (variable=="PCIP27") {
      xyplot(PCIP27 ~ year, group=INSTNM, xlim=c(start, end), type=typeval, span=spanval, auto.key=list(columns=2, lines=TRUE, points=TRUE), 
             lwd=lwdval, ylab="Proportion of graduates in Math and Statistics", par.settings = mtheme, data=dssmall)
    } else if (variable=="PCIP42") {
      xyplot(PCIP42 ~ year, group=INSTNM, xlim=c(start, end), type=typeval, span=spanval, auto.key=list(columns=2, lines=TRUE, points=TRUE), 
             lwd=lwdval, ylab="Proportion of graduates in Psychology", par.settings = mtheme, data=dssmall)
    } else if (variable=="PCIP45") {
      xyplot(PCIP45 ~ year, group=INSTNM, xlim=c(start, end), type=typeval, span=spanval, auto.key=list(columns=2, lines=TRUE, points=TRUE), 
             lwd=lwdval, ylab="Proportion of graduates in Social Science", par.settings = mtheme, data=dssmall)
    } else if (variable=="PCIP50") {
      xyplot(PCIP50 ~ year, group=INSTNM, xlim=c(start, end), type=typeval, span=spanval, auto.key=list(columns=2, lines=TRUE, points=TRUE), 
             lwd=lwdval, ylab="Proportion of graduates in Performing and Visual Arts", par.settings = mtheme, data=dssmall)
    } else if (variable=="PCIP54") {
      xyplot(PCIP54 ~ year, group=INSTNM, xlim=c(start, end), type=typeval, span=spanval, auto.key=list(columns=2, lines=TRUE, points=TRUE), 
             lwd=lwdval, ylab="Proportion of graduates in History", par.settings = mtheme, data=dssmall)
    } else {
      xyplot(runif(100) ~ runif(100))  # shouldn't get here...
    }
  })
})


