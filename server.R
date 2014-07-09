## server.R
library(shiny)
data(mtcars)

my_lm <- function(df, vars){ 
  my_formula <- sprintf("mpg ~ %s", vars[1])
  if (length(vars) > 1){
    for (i in 2:length(vars))
    my_formula <- sprintf("%s + %s", my_formula, vars[i])
  }
  model <- lm(eval(parse(text=my_formula)), data=df)
  return(summary(model))
}

shinyServer(
  function(input, output) {
    output$o_exp_var <- renderPrint({input$exp_var})
    output$o_vars    <- renderPrint({input$input_vars})
    output$exp_hist <- renderPlot({
      hist(mtcars[,input$exp_var], col='lightblue', 
           main="Exploratory Analysis", xlab=input$exp_var)
    })
    output$plot_2d <- renderPlot({
      plot(mtcars[,input$exp_var], mtcars[,"mpg"],
      xlab = input$exp_var, ylab="mpg",
      main="Scatter Plot")
    })
    output$o_summary <- renderPrint({my_lm(mtcars, input$input_vars)})
  }  
)
### __endline
