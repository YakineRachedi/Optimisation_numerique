# Visualisation des couches stratifiées

## Description
Dans ce programme, nous explorons un modèle de propagation d'ondes sismiques dans un milieu stratifié. Ce modèle simplifié repose sur l’hypothèse que les ondes sont émises depuis une source ponctuelle, telle qu’un épicentre, et traversent un milieu formé de couches parallèles. Chaque couche est définie par une épaisseur et une vitesse de propagation constantes. Les trajets des ondes respectent la loi de Descartes, minimisant le temps de trajet total.

## Objectifs
L’objectif principal est de représenter graphiquement les couches stratifiées et les trajectoires des rayons à l’aide d’une fonction MATLAB. Cette représentation met en évidence les interactions entre les couches et les rayons dans le modèle géologique.

## Contenu
- Les couches stratifiées sont représentées par des lignes horizontales empilées, chaque ligne correspondant à une interface entre deux couches.
- Les rayons sont visualisés comme des segments de lignes brisées, illustrant leur déviation en fonction des vitesses et des angles.

Nous utilisons les paramètres suivants :
- `d` : les déviations horizontales des rayons dans chaque couche.
- `h` : les épaisseurs des couches.
- `D` : la distance totale horizontale, mesurée entre la source et les géophones.

## Résultats attendus
Le graphique final met en scène :
1. Une vue claire des couches stratifiées, définies par leurs épaisseurs respectives.
2. Les trajectoires des rayons traversant les couches, illustrant la façon dont les ondes sismiques se propagent dans un milieu stratifié.

Ce travail permet de visualiser de manière intuitive un modèle complexe de propagation d'ondes, en traduisant des concepts mathématiques et physiques en une représentation graphique compréhensible.
