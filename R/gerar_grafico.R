
library(plotly)

criar_grafico_estado <- function(df,Estado){

  df %>%
    dplyr::filter(estado == Estado) %>%
    dplyr::mutate(data = as.Date(data)) %>%
    plot_ly(x = ~data, y = ~obitos_novos, type = 'scatter', mode = 'lines+markers') %>%
    layout(
      yaxis = list(title = " "),
      xaxis = list(title = " "),

      title = (text=(paste0("Mortes diaria em  ",Estado)))) %>%

    config(displaylogo = FALSE,
           modeBarbuttonsToRemove = c("zoomIn2d","zoomOut2d","pan2d"))


}



