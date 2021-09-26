## Importation des images de promotion
Les métadonnées élémentaires (année, niveau, recto ou verso, etc.) du jeu de données ["Photos de promotion"](https://github.com/ademec/hackathon) sont importées dans le démonstrateur [GallicaPix](https://github.com/altomator/Image_Retrieval) (archictecture ([BaseX](https://basex.org/) + REST + XQuery + IIIF). 

Les images sont appelées via le serveur IIIF de l'ENC ([exemple](https://iiif.chartes.psl.eu/images/encprom/encprom_1904-1905_2_1/encprom_1904-1905_2_1_1.jpg/full/full/0/default.jpg)). 

## Détection d'objets et de visages
Les images des promotions sont traitées avec plusieurs modèles de détection d'objets :
- [Yolo v4](https://github.com/kiyoshiiriemon/yolov4_darknet) (dans le cas du jeu, détection de personnes et de cravates)
- [MTCNN](https://github.com/jbrownlee/mtcnn) pour la détection des visages

![Yolo v4](https://github.com/ademec/Valda/blob/images/images/visuels/cravates.jpg)
*Exemple de détection de cravates avec Yolo v4*

Les scripts générent des données .csv qui sont ensuite importées dans la base GallicaPix.

Des analyses quantitatives sont produites à partir des détections.

![Genres des élèves](https://github.com/ademec/Valda/blob/images/images/visuels/genres.jpg)
*Analyse des genres des promotions (1904-1933)*


## Génération de l'image de la mégapromo
Les vignettes des visages sont exportées à l'aide de l'API Images IIIF (exemple) et redimensionnées à une largeur fixe (afin d'agrandir les petites images, script resize.py). Elles sont ensuite agrégées en une mégaimage de portraits au format carré (script matrice.py). 

Cette image est ensuite tuilée pour être visualisée avec [OpenSeadragon](https://openseadragon.github.io/docs/) (script make-deepzoom-tiles.py), un visualiseur offrant un zoom profond. Le script génère un fichier de métadonnées et une arborescence de tuiles, qui doivent être copiés dans l'application web de [visualisation](http://www.euklides.fr/blog/altomator/Megapixel/Visages-ENC.html).







