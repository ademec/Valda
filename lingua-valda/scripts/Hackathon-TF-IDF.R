###

# Author: Antoine Silvestre de Sacy
# Title: Scripts II d'analyse linguistique pour le Hackathon de l'ADEMEC (TF-IDF)
# Date: 25/09/2021
# Tags: hackathon, ADEMEC, ENC, TAL, NLP, stylistique.

### 

# Références TF-IDF : 

# Thx to : https://juliasilge.com/blog/term-frequency-tf-idf/

# Importation des librairies : 

library("tidyverse")
library("vroom")
library("stringr")
library("dplyr")
library("tidytext")
library("ggplot2")
library("viridis")
library("ggstance")
library("ggthemes")

## Années 1850-1880 :

## Répertoire de travail : 

setwd("~/txt-date/1850-1880/")

# Fichiers txt :

list_of_files <- list.files(recursive = TRUE,
                            pattern = "*.txt", 
                            full.names = TRUE)

df <- vroom(list_of_files, id = "FileName", delim = "\n", col_names = "mots", progress = T)

# Échantillonnage : 

df = df %>%
  na.omit(df$mots)

## Nettoyage : retrait identifier, creator, date, title : 

df$mots <- str_replace_all(df$mots, pattern = "title: .*", replacement = "")
df$mots <- str_replace_all(df$mots, pattern = "identifier: .*", replacement = "")
df$mots <- str_replace_all(df$mots, pattern = "creator: .*", replacement = "")
df$mots <- str_replace_all(df$mots, pattern = "date: .*", replacement = "")

# Nettoyage : ajout d'un saut de ligne en bout pour éviter erreurs étiquetage :
# Nettoyage encodage apostrophes :

df <- df %>%
  mutate(mots = stringr::str_replace_all(.$mots, "$", "\n")) %>%
  mutate(mots = stringr::str_replace_all(.$mots, "=", "")) %>%
  mutate(mots = stringr::str_replace_all(.$mots, "’", "'")) %>%
  mutate(mots = stringr::str_replace_all(.$mots, "'", "'"))

df$periode <- "1850-1880"

df_a <- df

## 1881-1910

setwd("~/txt-date/1881-1910/")

# Fichiers txt :

list_of_files <- list.files(recursive = TRUE,
                            pattern = "*.txt", 
                            full.names = TRUE)

df <- vroom(list_of_files, id = "FileName", delim = "\n", col_names = "mots", progress = T)

# Échantillonnage : 

df = df %>%
  na.omit(df$mots)

## Nettoyage : retrait identifier, creator, date, title : 

df$mots <- str_replace_all(df$mots, pattern = "title: .*", replacement = "")
df$mots <- str_replace_all(df$mots, pattern = "identifier: .*", replacement = "")
df$mots <- str_replace_all(df$mots, pattern = "creator: .*", replacement = "")
df$mots <- str_replace_all(df$mots, pattern = "date: .*", replacement = "")

# Nettoyage : ajout d'un saut de ligne en bout pour éviter erreurs étiquetage :
# Nettoyage encodage apostrophes :

df <- df %>%
  mutate(mots = stringr::str_replace_all(.$mots, "$", "\n")) %>%
  mutate(mots = stringr::str_replace_all(.$mots, "=", "")) %>%
  mutate(mots = stringr::str_replace_all(.$mots, "’", "'")) %>%
  mutate(mots = stringr::str_replace_all(.$mots, "'", "'"))

df$periode <- "1881-1910"

df_b <- df

## 1911-1940

setwd("~/txt-date/1911-1940/")

# Fichiers txt :

list_of_files <- list.files(recursive = TRUE,
                            pattern = "*.txt", 
                            full.names = TRUE)

df <- vroom(list_of_files, id = "FileName", delim = "\n", col_names = "mots", progress = T)

# Échantillonnage : 

df = df %>%
  na.omit(df$mots)

## Nettoyage : retrait identifier, creator, date, title : 

df$mots <- str_replace_all(df$mots, pattern = "title: .*", replacement = "")
df$mots <- str_replace_all(df$mots, pattern = "identifier: .*", replacement = "")
df$mots <- str_replace_all(df$mots, pattern = "creator: .*", replacement = "")
df$mots <- str_replace_all(df$mots, pattern = "date: .*", replacement = "")

# Nettoyage : ajout d'un saut de ligne en bout pour éviter erreurs étiquetage :
# Nettoyage encodage apostrophes :

df <- df %>%
  mutate(mots = stringr::str_replace_all(.$mots, "$", "\n")) %>%
  mutate(mots = stringr::str_replace_all(.$mots, "=", "")) %>%
  mutate(mots = stringr::str_replace_all(.$mots, "’", "'")) %>%
  mutate(mots = stringr::str_replace_all(.$mots, "'", "'"))

df$periode <- "1911-1940"

df_c <- df

## 1941-1970

setwd("~/txt-date/1941-1970/")

# Fichiers txt :

list_of_files <- list.files(recursive = TRUE,
                            pattern = "*.txt", 
                            full.names = TRUE)

df <- vroom(list_of_files, id = "FileName", delim = "\n", col_names = "mots", 
            progress = T)

# Échantillonnage : 

df = df %>%
  na.omit(df$mots)

## Nettoyage : retrait identifier, creator, date, title : 

df$mots <- str_replace_all(df$mots, pattern = "title: .*", replacement = "")
df$mots <- str_replace_all(df$mots, pattern = "identifier: .*", replacement = "")
df$mots <- str_replace_all(df$mots, pattern = "creator: .*", replacement = "")
df$mots <- str_replace_all(df$mots, pattern = "date: .*", replacement = "")

# Nettoyage : ajout d'un saut de ligne en bout pour éviter erreurs étiquetage :
# Nettoyage encodage apostrophes :

df <- df %>%
  mutate(mots = stringr::str_replace_all(.$mots, "$", "\n")) %>%
  mutate(mots = stringr::str_replace_all(.$mots, "=", "")) %>%
  mutate(mots = stringr::str_replace_all(.$mots, "’", "'")) %>%
  mutate(mots = stringr::str_replace_all(.$mots, "'", "'"))

df$periode <- "1941-1970"

df_d <- df

## 1970-2000

setwd("~/txt-date/1971-2000/")

# Fichiers txt :

list_of_files <- list.files(recursive = TRUE,
                            pattern = "*.txt", 
                            full.names = TRUE)

df <- vroom(list_of_files, id = "FileName", delim = "\n", col_names = "mots", progress = T)

# Échantillonnage : 

df = df %>%
  na.omit(df$mots)

## Nettoyage : retrait identifier, creator, date, title : 

df$mots <- str_replace_all(df$mots, pattern = "title: .*", replacement = "")
df$mots <- str_replace_all(df$mots, pattern = "identifier: .*", replacement = "")
df$mots <- str_replace_all(df$mots, pattern = "creator: .*", replacement = "")
df$mots <- str_replace_all(df$mots, pattern = "date: .*", replacement = "")

# Nettoyage : ajout d'un saut de ligne en bout pour éviter erreurs étiquetage :
# Nettoyage encodage apostrophes :

df <- df %>%
  mutate(mots = stringr::str_replace_all(.$mots, "$", "\n")) %>%
  mutate(mots = stringr::str_replace_all(.$mots, "=", "")) %>%
  mutate(mots = stringr::str_replace_all(.$mots, "’", "'")) %>%
  mutate(mots = stringr::str_replace_all(.$mots, "'", "'"))

df$periode <- "1971-2000"

df_e <- df

## 2001-2019

setwd("~/txt-date/2001-2019/")

# Fichiers txt :

list_of_files <- list.files(recursive = TRUE,
                            pattern = "*.txt", 
                            full.names = TRUE)

df <- vroom(list_of_files, id = "FileName", delim = "\n", col_names = "mots", progress = T)

# Échantillonnage : 

df = df %>%
  na.omit(df$mots)

## Nettoyage : retrait identifier, creator, date, title : 

df$mots <- str_replace_all(df$mots, pattern = "title: .*", replacement = "")
df$mots <- str_replace_all(df$mots, pattern = "identifier: .*", replacement = "")
df$mots <- str_replace_all(df$mots, pattern = "creator: .*", replacement = "")
df$mots <- str_replace_all(df$mots, pattern = "date: .*", replacement = "")

# Nettoyage : ajout d'un saut de ligne en bout pour éviter erreurs étiquetage :
# Nettoyage encodage apostrophes :

df <- df %>%
  mutate(mots = stringr::str_replace_all(.$mots, "$", "\n")) %>%
  mutate(mots = stringr::str_replace_all(.$mots, "=", "")) %>%
  mutate(mots = stringr::str_replace_all(.$mots, "’", "'")) %>%
  mutate(mots = stringr::str_replace_all(.$mots, "'", "'"))

df$periode <- "2001-2019"

df_f <- df


## ## ## ## ## 

# Merge :

final_corp <- full_join(df_a, df_b)
final_corp <- full_join(final_corp, df_c)
final_corp <- full_join(final_corp, df_d)
final_corp <- full_join(final_corp, df_e)
final_corp <- full_join(final_corp, df_f)

# Tokénisation :


tokenisation <- final_corp %>%
  unnest_tokens(output = token, input = mots)


## Dénombrement + filtrage éventuel des données : ex : n > 10

corpus_words_ngrams <- tokenisation %>%
  count(periode, token, sort = TRUE) %>%
  filter(n > 1) %>%
  ungroup()

##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  

# TF-IDF : 

## Ajout d'une colonne total words pour normaliser la fréquence (fréquence relative) :

total_words <- corpus_words_ngrams %>% 
  group_by(periode) %>% 
  summarize(total = sum(n))

corpus_TF_idf <- left_join(corpus_words_ngrams, total_words)

corpus_TF_idf <- corpus_TF_idf %>%
  bind_tf_idf(token, periode, n)

corpus_TF_idf <- corpus_TF_idf %>%
  select(-total) %>%
  arrange(desc(tf_idf))

plot_austen <- corpus_TF_idf %>%
  mutate(token = factor(token, levels = rev(unique(token))))

ggplot(plot_austen[1:20,], aes(tf_idf, token, fill = periode, alpha = tf_idf)) +
  geom_barh(stat = "identity") +
  labs(title = "Les mots les plus discriminants par période sur les positions de thèses de l'ENC",
       y = NULL, x = "tf-idf") +
  theme_tufte(base_family = "Arial", base_size = 13, ticks = FALSE) +
  scale_alpha_continuous(range = c(0.6, 1), guide = FALSE) +
  scale_x_continuous(expand=c(0,0)) +
  scale_fill_viridis(end = 0.85, discrete=TRUE) +
  theme(legend.title=element_blank()) +
  theme(legend.justification=c(1,0), legend.position=c(1,0))


plot_austen <- plot_austen %>% group_by(periode) %>% top_n(15) %>% ungroup

ggplot(plot_austen, aes(tf_idf, token, fill = periode, alpha = tf_idf)) +
  geom_barh(stat = "identity", show.legend = FALSE) +
  labs(title = "Les mots les plus discriminants par période sur les positions de thèses de l'ENC",
       y = NULL, x = "tf-idf") +
  facet_wrap(~periode, ncol = 2, scales = "free") +
  theme_tufte(base_family = "Arial", base_size = 13, ticks = FALSE) +
  scale_alpha_continuous(range = c(0.6, 1)) +
  scale_x_continuous(expand=c(0,0)) +
  scale_fill_viridis(end = 0.85, discrete=TRUE) +
  theme(strip.text=element_text(hjust=0)) +
  theme(strip.text = element_text(face = "italic"))


