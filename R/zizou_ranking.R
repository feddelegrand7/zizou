


zizou_ranking <- function(league, season = "2020-2021"){


# Checking if a league is available ----------------------
available_leagues <- c("liga",
                     "premier-league",
                     "ligue-1",
                     "serie-A",
                     "bundesliga",
                     "eredivisie",
                     "superliga",
                     "mls"
                     )



if(!league %in% available_leagues){


  stop(glue::glue("You need to choose from the following leagues: {knitr::combine_words(sort(available_leagues))}"))


}


# Checking if a season is available --------------------------------

available_seasons <- c("2020-2021",
                       "2019-2020",
                       "2018-2019",
                       "2017-2018",
                       "2016-2017"
)

if(!season %in% available_seasons){


  stop(glue::glue("Only the following seasons are available: {knitr::combine_words(available_seasons)}"))


}


link <- glue::glue("https://www.eurosport.com/football/{league}/{season}/standing.shtml")


ranking <- ralger::table_scrap(link)


ranking <- ranking[, -3]


names(ranking)[1] <- "Rank"


return(ranking)







}
