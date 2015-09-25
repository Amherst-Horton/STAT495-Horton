library(shiny)

shinyUI(fluidPage(
  titlePanel("Visualize College Scoreboard Data"),
  p('This site displays data on academic institutions over time (see https://collegescorecard.ed.gov/data for the College Scorecard, a project of the US Dept of Education).'),
  radioButtons("variable", "Which variable?",
    c("Area Studies" = "PCIP05", "Biological Studies" = "PCIP26", 
      "Computer Science" = "PCIP11", "History" = "PCIP54",
      "Math and Stats" = "PCIP27", "Performing and Visual Arts" = "PCIP50",
      "Psychology" = "PCIP42", "Social Science" = "PCIP45"
      )),
  radioButtons("additions", "Include line or smoother?",
               c("smoother"="smoother",
                 "line"="line")), 
  numericInput("startyear", "Enter starting year (between 1996 and 2012)",
    value=1996, min=1996, max=2012, step=1),
  numericInput("endyear", "Enter ending year (between 1997 and 2013)",
    value=2013, min=1997, max=2013, step=1),
  plotOutput("plot")
))

