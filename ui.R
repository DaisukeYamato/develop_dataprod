# ui.R
#h6("In this page, you can look at data of Motor Trend \
#                 Car Road Tests from R package (mtcars dataset) by creating histograms, \
#                 and also construct linear regression models you pick up.\
#                 The summary will be shown in the right panel after \
#                 clicking Submit button."),

shinyUI(pageWithSidebar(
  headerPanel(h2("Regressiom Models for Motor Trend Car Road Tests")
  ),
  sidebarPanel(
    h3("Description:"),
    h6("In this page, you can look at data of Motor Trend 
                 Car Road Tests from R package (mtcars dataset) by creating histograms, 
                 and also construct linear regression models you pick up.
                 In the regression models, the outcome is Miles /(US) gallon, called mpg
                 in our dataset.
                 The summary will be shown in the right panel after 
                 clicking Submit button."),
    h3('Exploratory Data Analysis'),
    radioButtons("exp_var", "Variable Distribution:", 
                c("mpg (Miles/(US) gallon)" = "mpg", 
                  "cyl (Number of cylinders)" = "cyl", 
                  "disp (Displacement (cu.in.))" = "disp",
                  "hp (Gross horsepower)"= "hp", 
                  "drat (Rear axle ratio)" = "drat",
                  "wt (Weight (lb/1000))" = "wt",
                  "qsec (1/4 mile time)" = "qsec",
                  "vs (V/S)" = "vs",
                  "am (Transmission (0 = automatic, 1 = manual))" = "am",
                  "gear (Number of forward gears)" = "gear", 
                  "carb (Number of carburetors)" = "carb")),
    submitButton('Submit'),
    h3('Input Variables'),
    checkboxGroupInput("input_vars", "Input Variables",
                       c(
                         "cyl" = "cyl",
                         "disp" = "disp",
                         "hp" = "hp", 
                         "drat" = "drat", 
                         "wt" = "wt",
                         "qsec" = "qsec",
                         "vs" = "vs",
                         "am" = "am",
                         "gear" = "gear",
                         "carb" = "carb")),
    #numericInput('id1', 'Numeric input, label id1', 0, min=0, max=10, step=1),
    #dateInput("date", "Date:"),
    submitButton('Submit')
    ),
  mainPanel(
    h3('Exploratory Data Analysis'),
    verbatimTextOutput("o_exp_var"),
    plotOutput('exp_hist'),
    plotOutput('plot_2d'),
    h3('Regression Model Summary'),
    verbatimTextOutput("o_vars"),
    verbatimTextOutput("o_summary")
    
  )
))
###__endline
