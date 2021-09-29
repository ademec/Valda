
## Les mots des chartistes



À l’occasion du bicentenaire de l’École nationale des chartes, l’ADEMEC, en partenariat et avec l’aide de l’École, organise un « hackathon bicentenaire ». L’objectif du hackathon est de proposer des créations numériques mettant en valeur les données sélectionnées, pour aborder l’histoire de l’École et sa production scientifique._


# Introduction

L'objectif de cette partie proprement stylistique sur les positions de thèse était d'explorer d'un point de vue diachronique ce corpus textuel. Nous nous sommes penchés sur trois questions :

*   Les thèmes ou concepts abordés dans ces positions de thèses.
*   L'évolution de la longueur de ces positions, et donc de leur statut, de leurs codes ou de leur importance.
*   Les idiosyncratismes stylistiques représentatifs de la langue employée par les chartistes au sein de ces positions et l'évolution de la langue et du "parler" scientifique et historique.

## Résultats

### Les mots du chartistes :

Analyse réalisée sur l'ensemble des positions de thèses (2950), représentant 8 336 760 mots.

![Fréquence](https://github.com/ademec/Valda/blob/main/valdapp/app/static/img/freq-total-final.png)

### Évolution de la longueur des positions des positions de thèses

Analyse réalisée sur l'ensemble des positions de thèses (2950), représentant 8 336 760 mots. L'axe des ordonnées donne le nombre de mots par position ; l'axe des absisses représente l'identifiant des positions ordonnés par ordre chronologique.

![Longueur](https://github.com/ademec/Valda/blob/main/valdapp/app/static/img/Evolution-longueur-position-final.png)

### Les idiosyncratismes du chartiste :

Analyse réalisée sur l'ensemble des positions de thèses (2950), représentant 8 336 760 mots.

**Procédure :**

*   Tokénisation
*   Lemmatisation
*   Étiquetage morphosyntaxique

Cf. [https://github.com/Malichot/Motifs](https://github.com/Malichot/Motifs)

**Temps de traitement** : 1h02'.

**Livrable à exploiter** : Motifs-idiosyncratiques-chartistes.csv

Quelques patterns intéressants :

*   L'énumération des noms propres.
*   L'utilisation des compléments de nom.
*   La précision de la date d'un événement historique.

![Capture1](https://github.com/ademec/Valda/blob/main/valdapp/app/static/img/Capture%20d%E2%80%99e%CC%81cran%202021-09-26%20a%CC%80%2013.02.51.png)

![Capture2](https://github.com/ademec/Valda/blob/main/valdapp/app/static/img/Capture%20d%E2%80%99e%CC%81cran%202021-09-26%20a%CC%80%2013.07.28.png)

### Les mots discriminants par période : l'évolution des intérêts chartistes.

Les analyses par TF-IDF (_term frequency-inverse term frequency_) permettent de mettre en valeur les mots qui sont les plus significatifs dans un corpus par rapport aux autres. Nous nous sommes ici fondés sur un découpage par période de trente ans. La périodisation est artificielle, certes, mais elle est déjà révélatrice de plusieurs choses.

![Tif1](https://github.com/ademec/Valda/blob/main/valdapp/app/static/img/Tf-IDF-periode.png)

![Tif2](https://github.com/ademec/Valda/blob/main/valdapp/app/static/img/TF-IDF-mots.png)

## Perspectives et horizons

L'analyse des métadonnées associées aux positions de thèse nous a également incités à nous pencher sur des questions sociologiques, en particulier l'évolution de la place des femmes au sein de l'école ainsi que leurs choix scientifiques. Nous nous sommes pour cela fondés sur une méthode de classification non-supervisée : les arbres de décision. Cette méthode très visuelle permet de mettre en évidence les variables qui ont le plus de poids dans l'attribution d'une prédiction (ici, le fait d'être un homme ou une femme chartiste). Ces analyses se sont fondées sur quatre variables : le genre, l'année de promotion, le fait d'avoir été professeur à l'École des chartes, la période d'étude (avant ou après telle date). Les résultats se présentent ainsi : 

![arbre_decision](https://github.com/ademec/Valda/blob/main/valdapp/app/static/img/Decision_plot.png)
