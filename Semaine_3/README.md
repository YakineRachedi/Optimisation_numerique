# Méthode de descente

## Objectif
Ce programme se concentre sur la mise en œuvre de l'algorithme de descente par la plus grande pente (Steepest Descent) avec une recherche linéaire adaptative pour minimiser une fonction non linéaire. L'objectif est d'explorer les performances et les limites de cette méthode dans le cadre de l'optimisation numérique.

## Description

### Calculs préliminaires
On considère la fonction :
\[
  f(x) = (x_1^2 + x_2 - 11)^2 + (x_1 + x_2^2 - 7)^2.
\]
Les expressions suivantes sont calculées :
- Le gradient \( \nabla f(x) \),
- La matrice hessienne \( H_f(x) \).

### Programmation de la fonction cible
Une fonction \( \text{fun\_test}(x) \) est programmée pour :
- Calculer la valeur scalaire \( y = f(x) \),
- Renvoyer le gradient \( g = \nabla f(x) \),
- Renvoyer la matrice hessienne \( H = H_f(x) \).

La fonction est adaptée pour gérer différents cas avec `nargout` :
- Extraction de la valeur scalaire seule,
- Extraction de la valeur et du gradient.

### Recherche linéaire adaptative
Une fonction \( \text{BLS} \) (Backtracking Line Search) est implémentée selon l'algorithme suivant :
1. Calcul des valeurs \( f(x_k) \) et \( \nabla f(x_k) \).
2. Initialisation du pas \( \alpha_k^0 \) à l'aide de la règle de Fletcher :
   \[
   \alpha_k^0 = - \Delta \frac{\langle d_k, \nabla f(x_k) \rangle}{\|d_k\|^2}.
   \]
   Plusieurs valeurs du paramètre \( \Delta \) sont testées.
3. Mise à jour du pas \( \alpha_k \) en vérifiant la condition d'arrêt sur \( \omega \).

### Algorithme de descente par la plus grande pente
En utilisant \( \text{BLS} \), l'algorithme de descente par la plus grande pente est programmé pour minimiser \( f(x) \). À chaque itération, le pas optimal est ajusté pour améliorer la convergence.

### Tests et visualisations
- L'algorithme est testé sur la fonction \( \text{fun\_test}(x) \).
- Les performances sont mesurées en termes de pas utilisés et du nombre d'appels à la fonction \( f(x) \), pour différents paramètres \( \omega \) et \( \rho \).
- Les tests sont réalisés avec deux points de départ \( x_0 = (1.2, 1.2)^T \) et \( x_0 = (-1.2, 1)^T \), en faisant varier les paramètres.

### Tracé des isovaleurs
Les isovaleurs de \( f(x) \) sont tracées pour visualiser le comportement de l'algorithme. Les positions successives \( x_k \) sont superposées sur ces courbes pour illustrer la trajectoire vers le minimum.

### Comparaison avec la méthode de Newton
L'algorithme est comparé à celui de Newton pour mettre en évidence les différences en termes de rapidité et de précision, ainsi que leur sensibilité au choix du point initial.

## Compétences développées
- Calculs analytiques pour déterminer gradient et hessien.
- Implémentation de méthodes de recherche linéaire en optimisation.
- Programmation et test d'algorithmes de descente.
- Visualisation et interprétation des trajectoires d'optimisation.
- Analyse comparative des méthodes d'optimisation.

## Résultats attendus
Cet exercice permet de :
- Explorer le comportement de la méthode de descente par la plus grande pente.
- Comprendre l'impact des paramètres \( \omega \), \( \rho \), et \( \Delta \) sur la convergence.
- Analyser les avantages et inconvénients de la méthode par rapport à celle de Newton.
- Illustrer les trajectoires et comprendre les régions d'attraction dans l'espace des paramètres.
