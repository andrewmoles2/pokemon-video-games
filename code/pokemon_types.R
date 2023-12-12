# load libraries ----
library(rvest)
library(tidyverse)

# url to pull data from ----
poke_type_html <- "https://pokemondb.net/type/dual"

# scrape table from page ----
pokemon_type <- poke_type_html %>%
  read_html() %>%
  html_element("table") %>%
  html_table()

# fix initial column issues ----
pokemon_type_clean <- pokemon_type %>%
  rename(typing = `ATTACK →\nDEFENSE ↴`) %>%
  filter(PKMN != "PKMN") %>%
  mutate(typing = str_remove(typing, "—"),
         typing = str_trim(typing))

# function to convert characters to numbers ----
fix_numbers <- function(x) {
  if (x == "") {
    x = 1
  } else if (x == 2) {
    x = 2
  } else if (x == 4) {
    x = 4
  } else if (x == "½") {
    x = 0.5
  } else if (x == "¼") {
    x = 0.25
  } else {
    x = 0
  }
  return(x)
}

# loop to convert for each column ----
# using array for speed
cols <- names(pokemon_type_clean[3:20])

attack <- array()

for (i in cols) {
  x <- map(pokemon_type_clean[[i]], fix_numbers) |> as.numeric()
  attack <- cbind(attack, x)
}

attack <- as.data.frame(attack)
attack <- attack[, -1]
colnames(attack) <- cols

# final cleaning steps ----
# bind fixed columns to main dataset and fix column names
pokemon_type_clean <- pokemon_type_clean %>%
  select(typing, PKMN) %>%
  cbind(attack) %>%
  rename(
    n_pokemon = PKMN,
    normal = Nor,
    fire = Fir,
    water = Wat,
    electric = Ele,
    grass = Gra,
    ice = Ice,
    fighting = Fig,
    poison = Poi,
    ground = Gro,
    flying = Fly,
    psychic = Psy,
    bug = Bug,
    rock = Roc,
    ghost = Gho,
    dragon = Dra,
    dark = Dar,
    steel = Ste,
    fairy = Fai
  )

# split type column and keep original column
typing = pokemon_type_clean$typing

pokemon_type_clean <- pokemon_type_clean %>%
  separate_wider_delim(cols = typing,
                              delim = " ",
                              names = c("type1", "type2"),
                              too_few = "align_start") %>%
  mutate(typing = typing) %>%
  select(typing, everything())

# write out data ----
write_csv(pokemon_type_clean, "data/pokemon_types.csv")


