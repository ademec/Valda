###

# Author: Antoine Silvestre de Sacy
# Title: Scripts d'arbres de décisions fondé sur le tsv
# Date: 25/09/2021
# Tags: hackathon, ADEMEC, ENC, TAL, NLP, stylistique.

### 

# Références : 

## Doc sur les arbres de décision : 

# https://rpubs.com/mdhafer/arbres_decisions 

# Deux stratégies :

# Sous ensemble des données d'entraînement.

# Choix de variables.

# Algorithme CART.

# L'arbre de décision délimite les régions de manière assez cubique.

## Les forêts aléatoires : 

# On peut arriver à découper des régions de manière plus sophisitiquée.

# http://michael.hahsler.net/SMU/EMIS7332/R/viz_classifier.html 


# Librairies :

library('data.table')
library("rpart")
library("rpart.plot")

# Répertoire de travail : 

setwd("~/")

meta <- fread(input = "encpos.tsv")

# Nettoyage : 

meta <- meta[-c(1:7),]

a <- grep(pattern = "PREV", x = meta$id)
b <- grep(pattern = "NEXT", x = meta$id)

meta <- meta[-c(a,b),]

# Sélection des variables qui nous intéressent : 

corpus_select <- meta %>%
  select(c(promotion_year, 
           author_gender, author_is_enc_teacher, 
           topic_notAfter))

# Transformation des NA en 0 pour les élèves devenus profs :

a <- is.na(corpus_select$author_is_enc_teacher)
b <- which(a == "TRUE")
corpus_select[b,3] <- 0

#Description des données :
summary(corpus_select)

# Arbre de décision : 

set.seed(1)
indexes = sample(x = 2996, size = 600) # 110 valeurs au hasard dans le train

# Création de deux corpus d'entraînement :

corpus_train = corpus_select[indexes,]
corpus_test = corpus_select[-indexes,]

# Création de l'arbre : 

arbre = rpart(author_gender ~., data = corpus_train, method = "class", control=rpart.control(minsplit = 5,cp=0,045))

# Affichage de l'arbre de décision
rpart.plot(arbre, box.palette = list("red","green"))

# #On cherche à minimiser l’erreur pour définir le niveau d’élagage
# plotcp(arbre)
# 
# #Affichage du cp optimal
# print(arbre$cptable[which.min(arbre$cptable[,4]),1])
# 
# #Elagage de l’arbre avec le cp optimal
# arbre_optimal <- prune(arbre,cp=arbre$cptable[which.min(arbre$cptable[,4]),1])
# 
# 
# #Représentation graphique de l’arbre optimal
# prp(arbre_optimal,extra=1)
# 
# rpart.plot(arbre, box.palette = list("red","green"))





