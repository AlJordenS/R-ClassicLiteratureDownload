library(readr)
library(dplyr)
library(stringr)
library(ggplot2)

books <- read_csv('data/books.csv')

twain <- filter(books, author == "Twain, Mark")

twain_refined <- twain %>% select(title, author, downloads, avg_words_per_sentence, sentences) 

