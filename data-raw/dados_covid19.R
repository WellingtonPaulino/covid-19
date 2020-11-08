## code to prepare `dados_covid19` dataset goes here

usethis::use_data(dados_covid19, overwrite = TRUE)

library(tidyverse)
library(httr)
library(magrittr)


link <- "https://xx9p7hp1p7.execute-api.us-east-1.amazonaws.com/prod/PortalGeral"
info_link <- GET(link,add_headers("x-parse-application-id" = "unAFkcaNDeXajurGB7LChj8SgQYS2ptm")) %>% content()

url_xlsx <- info_link$results[[1]]$arquivo$url
xlsx <- GET(url_xlsx,write_disk("covid.csv",overwrite = TRUE))

covid <- read.csv("covid.csv",sep =  ";")

df_covid <-
  covid %>%
  dplyr::filter(!is.na(estado) & estado != "") %>%
  dplyr::select(estado,data,casosAcumulado,casosNovos,obitosAcumulado,obitosNovos) %>%
  dplyr::group_by(estado,data) %>%
  summarise(casosAcumulado = sum(casosAcumulado),
            casosNovos= sum(casosNovos),
            obitosAcumulado = sum(obitosAcumulado),
            obitosNovos = sum(obitosNovos)) %>%
  janitor::clean_names()


readr::write_rds(df_covid,"data/df_covid19.rds")


unlink("covid.csv")
unlink("covid.zip")


