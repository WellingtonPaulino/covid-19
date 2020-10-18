## code to prepare `graficos` dataset goes here

df_covid <- readr::read_rds('data/df_covid19.rds')

source("R/gerar_grafico.R")
criar_grafico_estado(df_covid,"TO")
