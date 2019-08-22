ui <- fluidPage(
    sidebarLayout(
        sidebarPanel(
            actionButton("add", "Add 'Dynamic' tab")
        ),
        mainPanel(
            tabsetPanel(id = "tabs",
                        tabPanel("Hello", "This is the hello tab")
            )
        )
    )
)
server <- function(input, output, session) {
    n <- 0
    observeEvent(input$add, {
        n <<- n + 1
        tab_title <- paste("Dynamic ", n)
        appendTab(inputId = "tabs",
                  {
                      tabPanel(
                          tab_title,
                          paste("Content for dynamic tab", n)
                      )
                  }
        )
    })
    
}

shinyApp(ui, server)