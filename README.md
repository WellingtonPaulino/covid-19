
<!-- README.md is generated from README.Rmd. Please edit that file -->

# covid-19

<!-- badges: start -->

<!-- badges: end -->

``` r

library(magrittr)
library(ggplot2)

df<- readr::read_rds('data/df_covid19.rds')
```

    #> # A tibble: 27 x 2
    #> # Groups:   estado [27]
    #>    estado total_casos
    #>    <chr>        <int>
    #>  1 AC           59386
    #>  2 AL          178730
    #>  3 AM          302372
    #>  4 AP          100300
    #>  5 BA          669394
    #>  6 CE          528490
    #>  7 DF          408608
    #>  8 ES          287836
    #>  9 GO          473628
    #> 10 MA          361774
    #> # ... with 17 more rows
