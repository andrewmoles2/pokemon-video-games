# Pokémon Video Games &nbsp; :dragon:

The following project uses data from the [Pokemon Database site](https://pokemondb.net/). Data was scraped using R and packages including **rvest**. The result is two datasets. The first represents the in game statistics for each Pokémon. The second represents the strengths and weaknesses of each *typing* a Pokémon can be; for example, a fire Pokémon is good defensively against grass Pokémon and bad defensively against water Pokémon. These datasets can be joined using the type/typing column. 

Several changes have happened in the Pokémon games over the years since the first generation of games. There has been a gradual addition of new types. Dark and Steel were added in generation 2 and Fairy type was added in generation 6. Regional variants and mega evolution has also been added. More information can be found on [the gamer website](https://www.thegamer.com/pokemon-ways-the-games-have-changed/#regional-variants).

## About

Excerpts taken from [Wikipedia](https://en.wikipedia.org//wiki/Pok%C3%A9mon_(video_game_series)):

> Pokémon is a series of video games developed by Game Freak and published by Nintendo and The Pokémon Company under the Pokémon media franchise. It was created by Satoshi Tajiri with assistance from Ken Sugimori, the first games, Pocket Monsters Red and Green, were released in 1996 in Japan for the Game Boy, later released outside of Japan as Pokémon Red Version and Blue Version. The main series of role-playing video games (RPGs), referred as the "core series" by their developers, has continued on each generation of Nintendo's handhelds. The most recently released core series games, Pokémon Scarlet and Violet, were released on November 18, 2022, for the Nintendo Switch.

> The core games are released in generations, each with different Pokémon, storylines, and characters. Remakes of the games are usually released around a decade after the original versions for the latest console at the time. While the main series consists of RPGs developed by Game Freak, many spin-off games based on the series have been developed by various companies, encompassing other genres such as action role-playing, puzzle, fighting, and digital pet games.

There have been nine generations of Pokémon games, some with remakes and spin-offs. A full list can be found on [Wikipedia](https://en.wikipedia.org//wiki/List_of_Pok%C3%A9mon_video_games). 

## Data Dictionary

Data is available [here for Pokémon statistics ](https://github.com/andrewmoles2/pokemon-video-games/blob/main/data/pokemon_stats.csv) and [here for type statistics](https://github.com/andrewmoles2/pokemon-video-games/blob/main/data/pokemon_types.csv). 

`pokemon_stats_full.csv` is the same as `pokemon_stats.csv` but includes regional variations such as mega evolutions. 

To load data, you can use the below code snippets. 

For R:

```{r}
# option 1 - load using readr
pokemon_stats <- readr::read_csv("https://github.com/andrewmoles2/pokemon-video-games/blob/main/data/pokemon_stats.csv")

pokemon_types <- readr::read_csv("https://github.com/andrewmoles2/pokemon-video-games/blob/main/data/pokemon_types.csv")

# option 2 - load using base R read.csv
pokemon_stats <- read.csv("https://github.com/andrewmoles2/pokemon-video-games/blob/main/data/pokemon_stats.csv")

pokemon_types <- read.csv("https://github.com/andrewmoles2/pokemon-video-games/blob/main/data/pokemon_types.csv")
``` 

For Python:

```{python}
import pandas as pd

pokemon_stats = pd.read_csv("https://github.com/andrewmoles2/pokemon-video-games/blob/main/data/pokemon_stats.csv")

pokemon_types = pd.read_csv("https://github.com/andrewmoles2/pokemon-video-games/blob/main/data/pokemon_types.csv")
```

### pokemon_stats

Short summary of fields in the dataset:

| Field      | Description                                         |
|------------|-----------------------------------------------------|
| number     | National Pokédex number                             |
| name       | Name of Pokémon                                     |
| type       | Type of Pokémon                                     |
| type1      | First type                                          |
| type2      | Second type (some Pokémon only have 1 type)         |
| total      | Total statistics                                    |
| hp         | Hit points                                          |
| attack     | Attack                                              |
| defense    | Defence                                             |
| sp_atk     | Special attack                                      |
| sp_def     | Special defence                                     |
| speed      | Speed                                               |
| legendary  | Boolean if classed as legendary or mythical Pokémon |
| generation | The generation of game Pokémon first appeared       |
| image_url  | URL to image of Pokémon                             |

### pokemon_types

Short summary of fields in the dataset:

| Field     | Description                      |
|-----------|----------------------------------|
| typing    | Type of Pokémon                  |
| type1     | First type                       |
| type2     | Second type                      |
| n_pokemon | Number of Pokémon of this typing |
| normal    | Type attacking                   |
| fire      | Type attacking                   |
| water     | Type attacking                   |
| electric  | Type attacking                   |
| grass     | Type attacking                   |
| ice       | Type attacking                   |
| fighting  | Type attacking                   |
| poison    | Type attacking                   |
| ground    | Type attacking                   |
| flying    | Type attacking                   |
| psychic   | Type attacking                   |
| bug       | Type attacking                   |
| rock      | Type attacking                   |
| ghost     | Type attacking                   |
| dragon    | Type attacking                   |
| dark      | Type attacking                   |
| steel     | Type attacking                   |
| fairy     | Type attacking                   |



