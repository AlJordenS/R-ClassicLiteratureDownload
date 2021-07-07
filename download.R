library(readr)
library(dplyr)
library(stringr)
library(ggplot2)

books <- read_csv('data/books.csv')

twain <- filter(books, author == "Twain, Mark")

twain_refined <- twain %>% select(title, author, downloads, avg_words_per_sentence, sentences) 

twain_by_download <- twain_refined %>% arrange(desc(downloads))

unique_books <- function(data, column = 'title') {
  items <- data %>% pull(column)
  duplicates <- list()
  for (item in items) 
  {
    match <- agrep(item, items)
    last <- match [-1]
    if (length(last))
    {
      duplicates[[last]] <- last
    }
  }
  remove <- unique(unlist(duplicates))
  data[-remove, ]
}

twain_unique <- unique_books(twain_by_download, 'title')
p <- ggplot() + geom_bar()
plot(p)