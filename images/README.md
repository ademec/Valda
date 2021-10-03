# [Hackathon du bicentenaire de l'Ecole nationale des Chartes](http://www.chartes.psl.eu/fr/actualite/hackathon-du-bicentenaire) (septembre 2021)


## Importation des images de promotion
Les métadonnées élémentaires (année, niveau, recto ou verso, etc.) du jeu de données ["Photos de promotion"](https://github.com/ademec/hackathon) sont importées dans le démonstrateur [GallicaPix](https://github.com/altomator/Image_Retrieval) (architecture ([BaseX](https://basex.org/) + REST + XQuery + IIIF). 

Les images sont appelées via le serveur IIIF de l'ENC ([exemple](https://iiif.chartes.psl.eu/images/encprom/encprom_1904-1905_2_1/encprom_1904-1905_2_1_1.jpg/full/full/0/default.jpg)). 

## Détection d'objets et de visages
Les images des promotions sont traitées avec plusieurs modèles de détection d'objets :
- [Yolo v4](https://github.com/kiyoshiiriemon/yolov4_darknet) (dans le cas du jeu, détection de personnes et de cravates)
- [MTCNN](https://github.com/jbrownlee/mtcnn) pour la détection des visages

Les scripts générent des données .csv qui sont ensuite importées dans la base GallicaPix.


![Yolo v4](https://github.com/ademec/Valda/blob/images/images/visuels/cravates.jpg)
*Exemple de détection de cravates avec Yolo v4*

Des analyses [quantitatives](https://altomator.github.io/Introduction_to_Deep_Learning-2-Face_Detection/ENC/Graphes/illustrations-cravates.htm) sont produites à partir des détections (grapheur Javascript : Highcharts). Dans l'exemple suivant, les visages des élèves femmes sont annotés manuellement puis des statistiques sont produites.

[![Genres des élèves](https://github.com/ademec/Valda/blob/images/images/visuels/genres.jpg)](https://altomator.github.io/Introduction_to_Deep_Learning-2-Face_Detection/ENC/Graphes/illustrations-genrees_an.htm)

*Analyse du genre des élèves d'après les photographies de promotion (1904-1933)*


## Génération de l'image de la "mégapromo"
Les vignettes de 820 visages sont exportées à l'aide de l'API Images IIIF (exemple) et redimensionnées à une largeur fixe (afin d'agrandir les petites images, script resize.py). Elles sont ensuite agrégées en un trombinoscope géant au format carré (script matrice.py). 

Cette image est ensuite tuilée pour être visualisée avec [OpenSeadragon](https://openseadragon.github.io/docs/) (script make-deepzoom-tiles.py), un visualiseur offrant un zoom profond. Le script génère un fichier de métadonnées et une arborescence de tuiles, qui doivent être copiés dans l'application web de [visualisation](https://altomator.github.io/IIIF/megapixels/Visages-ENC.html).

[![megapixel](https://github.com/ademec/Valda/blob/images/images/visuels/mosaique.jpg)](https://altomator.github.io/IIIF/megapixels/Visages-ENC.html)

*L'image des portraits dans OpenSeadragon*


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


La complexité des différents modèles d'identification des élèves présents sur les photos (au recto, au verso, par renvois de numéro, etc.) incite plutôt à mettre en place une interface participative nourrie par les détections de visage et les propositions de nom extraites du référentiel des chartistes (avec l'information de l'année de promotion).

Cette identification permet ensuite de lier les visages à leur position de thèse et à leurs identifiants IDREF et VIAF. Un test est réalisé sur la promotion 1904-1905.

![ids](https://github.com/ademec/Valda/blob/images/images/visuels/identification.jpg)

## Portraits type
*à finir*

## Diffusion des données avec IIIF
Les manifestes des documents ENC sont accessibles depuis GallicaPix.

## Perspectives
1. Campagne participative pour l'identification des visages
2. Inclusion du jeu de données Portraits (sous réserve de IIIFication)
3. Valorisation
- Génération du visage type du chartiste (moyennage de visages)
- Création d'une mosaique HTML des visages avec liens vers les positions de thèse et sites VIAF, IdRef
- Affichage des visages et des photos de promotion depuis le portail des positions de thèse
- Exportation des données sous forme d'annotations IIIF visualisables dans Mirador

