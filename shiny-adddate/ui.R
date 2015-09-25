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
  plotOutput("plot")
))

