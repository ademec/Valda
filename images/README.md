# Hackathon du bicentenaire de l'Ecole nationale des Chartes <br/>
Septembre 2021

[Lien](http://www.chartes.psl.eu/fr/actualite/hackathon-du-bicentenaire)


## Importation des images de promotion
Les métadonnées élémentaires (année, niveau, recto ou verso, etc.) du jeu de données ["Photos de promotion"](https://github.com/ademec/hackathon) sont importées dans le démonstrateur [GallicaPix](https://github.com/altomator/Image_Retrieval) (archictecture ([BaseX](https://basex.org/) + REST + XQuery + IIIF). 

Les images sont appelées via le serveur IIIF de l'ENC ([exemple](https://iiif.chartes.psl.eu/images/encprom/encprom_1904-1905_2_1/encprom_1904-1905_2_1_1.jpg/full/full/0/default.jpg)). 

## Détection d'objets et de visages
Les images des promotions sont traitées avec plusieurs modèles de détection d'objets :
- [Yolo v4](https://github.com/kiyoshiiriemon/yolov4_darknet) (dans le cas du jeu, détection de personnes et de cravates)
- [MTCNN](https://github.com/jbrownlee/mtcnn) pour la détection des visages

![Yolo v4](https://github.com/ademec/Valda/blob/images/images/visuels/cravates.jpg)
*Exemple de détection de cravates avec Yolo v4*

Les scripts générent des données .csv qui sont ensuite importées dans la base GallicaPix. Des analyses [quantitatives](https://altomator.github.io/Introduction_to_Deep_Learning-2-Face_Detection/ENC/Graphes/illustrations-cravate.htm) sont produites à partir des détections. 

Une annotation manuelle des visages d'élèves femmes permet de produire cette analyse statistique (grapheur : Highcharts).

[![Genres des élèves](https://github.com/ademec/Valda/blob/images/images/visuels/genres.jpg)](https://altomator.github.io/Introduction_to_Deep_Learning-2-Face_Detection/ENC/Graphes/illustrations-genrees_an.htm)
* Analyse du genre des élèves des promotions 1904-1933*


## Génération de l'image de la "mégapromo"
Les vignettes de 820 visages sont exportées à l'aide de l'API Images IIIF (exemple) et redimensionnées à une largeur fixe (afin d'agrandir les petites images, script resize.py). Elles sont ensuite agrégées en une mégaimage de portraits au format carré (script matrice.py). 

Cette image est ensuite tuilée pour être visualisée avec [OpenSeadragon](https://openseadragon.github.io/docs/) (script make-deepzoom-tiles.py), un visualiseur offrant un zoom profond. Le script génère un fichier de métadonnées et une arborescence de tuiles, qui doivent être copiés dans l'application web de [visualisation](http://www.euklides.fr/blog/altomator/Megapixel/Visages-ENC.html).

[![megapixel](https://github.com/ademec/Valda/blob/images/images/visuels/mosaique.jpg)](http://www.euklides.fr/blog/altomator/Megapixel/Visages-ENC.html)

*L'image du trombinoscope dans OpenSeadragon*


## Identification des élèves
Un test est mené sur la première photographie de promotion disponible [(1904-1905)](promotion). L'image est traité par l'OCR de l'API Google Cloud Vision. L'OCR renvoie le texte suivant :
- M: Serpette de Buscar cond 
- Mr Retter 
- Colinant 
- 4. Laternche 
- l'Aubert 
- NP. Gausier 
- 4. Requé 
- Hide Florival 
- M' Artonne
- M' - M. Bigot 
- e - # Jawene 
- ll. Desage 
- Canal 
- M. de Maupachant 
- 1.4.7 sebeboede 
- Graziani 
- M. I. de Larme 
- il Valment 
- o Cochin 
- M'Mousset 
- de Man 
- M. Valois

![OCR](https://github.com/ademec/Valda/blob/images/images/visuels/google.jpg)


Une comparaison avec les noms du [référentiel des chartistes](https://github.com/ademec/hackathon)  permet de retrouver les patronymes corrects :
- Serpette De Bersaucourt 
- George Ritter 
- Pierre Colmant 
- Robert Latouche 
- Gaston Robert 
- Pierre Gautier 
- Jean Régné 
- Henri Roussen De Florival, De 
- André Artonne ...


La complexité des différents modèles d'identification des élèves présents sur les photos (au recto, au verso, par renvois de numéro, etc.) incite à mettre en place une interface participative nourrie par les détections de visage et des propositions de nom extraites du référentiel des chartistes.

Cette identification permet ensuite de lier les visages à leur position de thèse et à leurs identifiants IDREF et VIAF.

![ids](https://github.com/ademec/Valda/blob/images/images/visuels/identification.jpg)

## Portrait type des élèves

## Perspectives

