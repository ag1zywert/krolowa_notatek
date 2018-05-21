library(readr)
movies <- read_csv("C:/Users/asus/Desktop/studia/TIPNY_r/movies.csv")
View(movies)
library(tidyverse)



# Zad 5 - 2


filter(movies, year == 2005, Comedy == 1)



# Zad 5 - 3

select (movies, title, year, budget) %>% arrange(desc(budget))

# Zad 5 - 4

filter (movies, year >= 1990 & year < 2000, Animation == 1) %>% arrange(desc(rating))

# wersja na bezczela

filter (movies, year >=1990 & year < 2000, Animation == 1, rating > 9.0)

# Zad 5 - 5

filter (movies, Drama == 1) %>% arrange(desc(length))

# wersja na agate zywert

filter (movies, Drama == 1, length > 400)

# zad 5 - 6

group_by(movies, mpaa) %>% 
  summarise (srednia = mean(rating), odchylenie = mad(rating))


# zad 5 - 7

filmy_spokoloko <- filter(movies, votes > 100, budget > 3000000)
ggplot(data = filmy_spokoloko) +
  geom_point(mapping = aes(x = rating, y = budget, alpha = 3/10, fill = budget, fill = rating)) +
  geom_smooth(mapping = aes(x = rating, y = budget)) +
  labs(title = "Czy wyzszy budzet powoduje, ze film jest lepszy?", x = "ocena", y = "budżet")
