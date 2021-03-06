
---
title: Hackhaton ADEMEC
tags: hackathon, ADEMEC, ENC
date: 25/09/20921
---

# Hackhaton ADEMEC -- Équipe Valda

https://github.com/ademec/Valda
https://github.com/chartes/encpos/tree/master/data

## Choix du sujet : 

### Positions de thèses numérisées : 

#### 1. Les positions de thèses : 

- Informations métiers / photographie : lier les photos aux noms.
- Quelles thèses ont été poursuivies en doctorat ? Quel est leur sujet ? API theses.fr. Histoire sociale des chartistes. 
- Beaucoup d'informations géographiques dans les titres de thèses, les carnets de Quicherat (et le catalogue de la bibliothèque) >> peut-on faire une carte ?
- Evolution du style des positions de thèse au fil du temps

**Ressources et liaison avec les problématiques :**

- Approche sociologique et géographique (origine sociale, origine géographique, diplome antérieur,sexe) (P1 : Les métadonnées des positions de thèses. (tableur : 280K ; json : 18 M ; 3185 lignes)).

- Sexe et genre des chartistes : P1.

- Y a-t-il des dynasties de chartistes ? Check via wikidata pour vérification. 

- Date, période d'étude : retracer les centres d'intérêts et les périodes d'étude des chartistes au fil du temps (évolution ? Changements de centre d'intérêts et de périodes d'étude ? Un passage d'un intérêt pour le médiéval vers le contemporain ?).

- Analyse stylistique (P2 : Les positions de thèse (texte). (Archive zippée 21M ; Dézippée 70M)).


- Informations métiers / photographie : lier les photos aux noms (P3 : Les positions de thèse (image). (Pas d’archive téléchargeable (API IIIF)).
    
- Y a-t-il un visage type du médiéviste ? Du contemporanéiste ? (P3 : Les positions de thèse (image). (Pas d’archive téléchargeable (API IIIF)). Cf. Jeux de données sur les portraits de chartistes : à récupérer pour alimenter le corpus. 

- Identifier les anciens élèves qui sont devenus profs ;
    
    
##### Idée de rendu : 

- Une carte interactive avec des entrées multiples (lieu de naissance, centres d'intérêt géographique des positions de thèses). 
- Part-on de l'entité personne, positionnée sur sa notice biblio ou sa géolocalisation ? Ou une analyse des chartistes en tant que groupe ? Analyse par clusters (temporalisée) VS analyse qui part des personnes (portraits, géographiques). Il semblerait que l'analyse par cluster soit plus rigolote.

##### Questions de recherche : 

- Les sujets de recherche : quelles périodes et quels lieux ?
- L'origine et l'évolution du genre.
- Les lieux cités.
- L'évolution stylistique des positions de thèse.
- Quel est le chartiste type ? 
- Quelle est la photo de famille ?
- Quelle est le pattern stylistique type du chartiste ?

##### Approche : 

- Dans le cadre du bicentenaire, présenter l'ENC à ceux qui ne la connaissent pas. Faire connaître l'école à travers ses propres données via un regard oblique. Un guide historique à l'attention des élèves, des futurs, des anciens. Qui étiez-vous ? 
- Les chartistes, tous médiévistes ? Tous archivistes ? Tous parisiens ? Tous toulousains ?
- Mise en pratique des méthodes des élèves d'aujourd'hui.
- Si Jules Quicherat revenait à l'École aujourd'hui à l'École ?

##### Livrable : 

- Un datapaper : ce qui nous permet de suivre une problématique de recherche scientifique, d'avoir les visualisations, d'éditorialiser. 



#### 2. Photos de promo : 

Pas la même période temporelle que les positions de thèses (1905-1930). Pas énormément de photos. 

- Environ 800 visages ;
- Analyse macro : on peut faire des choses avec les visages, on peut les repérer mais qu'en fait-on après ? Beaucoup plus compliqué de lier les noms (disponibles dans le fichier de thèses) aux photos. Le visage type des années 10, 20, 30.
- Analyse micro : liaison visage nom / évolution des genres / identification profs et élèves.

#### 3. Portraits des chartistes

- Ceux qui sont académiciens ? Détection des uniformes ?

- Lié à l'idée de visage type ?

#### 4. Catalogue bibliothèque : 

- Mettre en lien le nombre de thèses sur un sujet x par rapport au nombre de livres qui existent sur cette thématique ? Corrélation ? Pas assez de métadonnées...
- Quelle est la part des auteurs chartistes dans la bibliothèque ?
- La problématique des "tirés à part" : qui les envoie ?


#### 5. Archives du centenaire de l'Ecole :

- Liaison entre ajd et hier : que s'est-il passé à l'époque ? Que se passe-t-il aujourd'hui ? Qu'en faire ensuite que la simple comparaison ?
- Appel un traitement sur le texte : comment extraire des données des images ? OCR puis NLP.
- Corpus intéressant pour une approche éditoriale.
- Enjeux = comment mettre en valeur ce fonds d'archives, et pas ce qu'il va nous apprendre sur le groupe.

#### 6. Carnets de Jules Quicherat : 

- Une carte... (itinéraire de Quicherat)
- Idem que le jeu précédent >> c'est un sujet en soit mais très difficile de le lier aux autres ensembles.

#### 7. Wikipédia et les chartistes : 

- À lier avec le premier sujet ?
- Aggrégation des deux jeux de données : on a la période dans le premier, la thématique dans le second (à homogénéiser car champs multiples...). 

#### 8. Le référentiel : 

- Peut servir de colonne vertébrale : activité principale du chartiste.
- Potentiellement des doublons donc faire un nettoyage.
- À lier avec le sujet 7 et le 1 ?
- Lier le sujet d'étude et l'activité professionnelle ? 625 / 3000 valeurs renseignées.
- Sur Wikipedia : article Liste d'élèves de l'École des chartes avec les activités > https://fr.wikipedia.org/wiki/Liste_d%27%C3%A9l%C3%A8ves_de_l%27%C3%89cole_des_chartes


## Attribution des rôles : 

## Technologie utilisée : 

- Jupyter notebook qui ouvre des liens vers l'appli Flask.
- Application Flask
- Portraits : BaseX, megapixel opencdrive.

## Attribution des tâches : 

Tâche préalable : 

- Dataïku : nettoyage / sélection des données.

**Lucie** : 

- Carnet de bord
- Récupérer les lieux dans les titres de thèses.

**Antoine** : 

- Analyse stylistique : 
    - Les mots du chartistes : DONE.
    - À refaire sur des périodes de 30 ans ?
    - Évolution de la longueur des positions de thèse : DONE. À transformer en nuage de points, retirer la légende des x. 
    - Les patterns : OK, DONE, à reprendre lors de la mise à l'échelle pour choisir ceux que l'on met en avant. À intégrer dans un jupyternotebook.
    - Les thèmes : ne fonctionne pas.
    - TF-IDF : les mots les plus discriminants sur des périodes de trente ans : en cours.

- Analyse des données : Arbres de décision : variables les plus significatives dans :
    - hommes / femmes ?
    - thèmes ?

==> quelles métadonnées à choisir ?

**Jean-Damien** : 

- Carte : sujets de thèse : lieux de naissance, lieu des thèses. 

**Jean-Philippe** : 

- Portraits types.
- Mosaïque des portraits.

## Rétro-planning : 

- Fin du travail samedi soir.
- Prototypes opérationnels.
- Dimanche matin : mise en forme, présentation.

## Bilan de la première journée

### Ce qu'on a fait / ce qu'il faut faire
- Lucie + Jean-Damien : récupération des entités nommées "localisation", nettoyage des résultats sur Dataiku, récupération des coordonnées GPS des lieux, création d'une carte geojson ;
  - A faire demain : encoder certains lieux à la main ? Ajouter les thèses qui portent sur les lieux de la carte, avec lien vers : soit l'url donnée dans le data set de départ, soit vers une page html avec le texte de la position (nécéssite une feuille XSLT). Possibilité d'ajouter le nom de l'auteur, avec renvoi vers une fiche biographique OU vers Idref ou Wikipedia/data. + Fonctionnalité leaflet clustering pour réduire le nombre de point et rendre la carte plus agréable.
- Antoine : transformation du corpus en txt, analyse de la fréquence des mots sur un échantillon, donne les mots les plus utilisés par les chartistes + taille des posititons de thèse. Mot le plus utilisé dans l'échantillon : roi. + Pattern stylistique : étiquettes grammaticales + mots outils qui donnent des patterns stylistiques + analyse des mots les plus discriminants sur une période de 30 ans (1850-1870 VS 1870-1900 etc). + Prendre le tableau des métadonnées avec TSV et faire un arbre de décision (ex : quand tu es une femme, tu as plus de chance d'étudier cette période...).
  - A faire demain : intervalle de 30 ans pour voir si les mots changent ? Identifier les patterns stylistiques les plus fréquentes et les mettre en contexte (= identifier les rangaines du chartistes ? rythme ternaire, adjectifs antéposés = à intégrer dans Jupyter Notebook ?)
- Jean-Philippe : toutes les photos de promo dans gallica pix, identification des visages, trombinoscope géant géré en zoom profond. Partir des photos de promo et avoir le lien (manuel) vers IDREF ou les positions de thèses ? Rejoint la carte et créé un éco-sytème : perspective à long terme.

### Idées pour la narration

Notion que ce site sera un écosystème >> les trois ensembles se répondent, à terme possibilité d'avoir des dashboards qui permettraient d'ntérroger en direct les positions de thèse.

4 niveaux envisagés :

1. Visualisation géographique ;
2. Portrait et liaison des id entre eux ;
3. Interrogation du corpus ;
4. médiation culturelle (portrait type, mosaïque, graphe de genre) ;

## Bilan de la deuxième demi-journée

### Ce qu'on a fait

- Jean-Damien : développement d'un script qui permet de localiser sur la cacrte une liste de thèses consacrée à un point précis.
- Aurélien / Lucie : précision des données de localisation, rédaction du carnet de bord
- Antoine : création d'arbres de décision, rédaction de son protocole de recherche
- Jean-Philippe : création d'une branche "images", rédaction de son protocole de recherche

# Introduction

L'objectif de cette partie proprement stylistique sur les positions de thèse était d'explorer d'un point de vue diachronique ce corpus textuel. Nous nous sommes penchés sur trois questions : 

- Les thèmes ou concepts abordés dans ces positions de thèses.
- L'évolution de la longueur de ces positions, et donc de leur statut, de leurs codes ou de leur importance.
- Les idiosyncratismes stylistiques représentatifs de la langue employée par les chartistes au sein de ces positions et l'évolution de la langue et du "parler" scientifique et historique.

## Résultats

### Les mots du chartistes : 

Analyse réalisée sur l'ensemble des positions de thèses (2950), représentant 8 336 760 mots. 

![Fréquence](https://github.com/ademec/Valda/blob/main/lingua-valda/visualisations/freq-total-final.png)

### Évolution de la longueur des positions des positions de thèses

Analyse réalisée sur l'ensemble des positions de thèses (2950), représentant 8 336 760 mots. L'axe des ordonnées donne le nombre de mots par position ; l'axe des absisses représente l'identifiant des positions ordonnés par ordre chronologique. 

![Longueur](https://github.com/ademec/Valda/blob/main/lingua-valda/visualisations/Evolution-longueur-position-final.png)

### Les idiosyncratismes du chartiste : 

Analyse réalisée sur l'ensemble des positions de thèses (2950), représentant 8 336 760 mots. 

**Procédure :** 

- Tokénisation
- Lemmatisation 
- Étiquetage morphosyntaxique

**Temps de traitements** : 1h02'.

**Livrable à exploiter** : Motifs-idiosyncratiques-chartistes.csv

Quelques patterns intéressants : 

- L'énumération des noms propres.
- L'utilisation des compléments de nom.
- La précision de la date d'un événement historique.

![Capture1](https://github.com/ademec/Valda/blob/main/lingua-valda/visualisations/Capture%20d%E2%80%99e%CC%81cran%202021-09-26%20a%CC%80%2013.02.51.png)

![Capture2](https://github.com/ademec/Valda/blob/main/lingua-valda/visualisations/Capture%20d%E2%80%99e%CC%81cran%202021-09-26%20a%CC%80%2013.07.28.png)

### Les mots discriminants par période : l'évolution des intérêts chartistes.

Les analyses par TF-IDF (*term frequency-inverse term frequency*) permettent de mettre en valeur les mots qui sont les plus significatifs d'un corpus par rapport à l'autre. Nous nous sommes ici fondé sur un découpage par périodes de trente ans - artificiel, certes, mais déjà révélateurs de plusieurs choses.

![Tif1](https://github.com/ademec/Valda/blob/main/lingua-valda/visualisations/Tf-IDF-periode.png)

![Tif2](https://github.com/ademec/Valda/blob/main/lingua-valda/visualisations/TF-IDF-mots.png)

## Horizons et perspectives : 

L'analyse des métadonnées associées aux positions de thèse nous a également incité à nous pencher sur des questions sociologiques, en particulier l'évolution de la place des femmes au sein de l'école ainsi que leurs choix scientifiques. Nous nous sommes pour cela fondés sur une méthode de classification non-supervisée : les arbres de décision. Cette méthode très visuelle permet de mettre en évidence les variables qui ont le plus de poids dans l'attribution d'une prédiction (ici, le fait d'être un homme ou une femme chartiste). Ces analyses se sont fondés sur quatre variables : le genre, l'année de promotion, le fait d'avoir été professeur à l'École des chartes, la période d'étude (avant ou après telle date). Les résultats se présentent ainsi : 

![Arbre](https://github.com/ademec/Valda/blob/main/lingua-valda/visualisations/Decision_plot.png)








