# Génération des données et visualisation pour les SVM

## Description
Dans cet exercice, nous travaillons sur les **Machines à Vecteurs de Support (SVM)**, une méthode d’apprentissage supervisé utilisée pour la classification et la régression. L’objectif est de générer des données, de les représenter graphiquement, et de visualiser une droite de séparation qui pourrait être déterminée par une SVM.

## Objectifs
L’objectif de cet exercice est de produire un ensemble de points dans un plan 2D, d’assigner des étiquettes à ces points en fonction de leur position par rapport à une droite, et de visualiser ces données avec des couleurs différenciées pour chaque classe.

## Méthodologie
- Une droite initiale est définie par son équation \( w_1x_1 + w_2x_2 + b = 0 \), avec des coefficients \( w_1 \), \( w_2 \) et \( b \).
- Un ensemble de points est généré autour de cette droite :
  - Les points au-dessus de la droite sont associés à l’étiquette \( y = +1 \).
  - Les points en dessous de la droite sont associés à \( y = -1 \).
- Les données générées sont organisées dans une matrice \( X \in \mathbb{R}^{2 \times N} \) pour les coordonnées, et un vecteur \( Y \in \mathbb{R}^N \) pour les étiquettes.

## Résultats attendus
Le graphique final montre :
1. La droite initiale représentée en noir.
2. Les points au-dessus de la droite affichés en bleu.
3. Les points en dessous de la droite affichés en rouge.

Ce travail fournit une visualisation des données nécessaires à l’utilisation de la méthode SVM pour la classification supervisée.
