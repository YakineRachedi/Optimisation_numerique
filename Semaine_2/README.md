# Méthode de Newton-Raphson

## Objectif
L'objectif est de mettre en œuvre la méthode de Newton-Raphson pour résoudre des équations non linéaires et explorer ses applications, notamment à travers la visualisation des bassins d'attraction.

## Description

### Programmation de la méthode de Newton-Raphson
On implémente la méthode de Newton-Raphson pour résoudre des équations de la forme \( G(X) = 0 \), où \( G : \mathbb{R}^n \to \mathbb{R}^n \). La fonction prend en entrée :
- \( G \), une fonction définissant l'équation, ainsi que son jacobien,
- \( X_0 \), un point de départ,
- \( \varepsilon \), une tolérance pour la convergence,
- \( \text{max\_iter} \), un nombre maximum d'itérations.

La méthode retourne la racine approximative \( X^* \), la valeur \( G(X^*) \), et le nombre d'itérations effectuées.

### Cas test avec une fonction quadratique
On applique la méthode à la fonction \( G_{\text{test}} : \mathbb{R}^2 \to \mathbb{R}^2 \), définie par le gradient :
\[
G_{\text{test}}(X) = \nabla f(X), \quad \text{où } f(X) = (X_1 - 1)^2 + (X_2 - 2)^4.
\]
On calcule \( G_{\text{test}}(X) \) et sa matrice jacobienne \( JG_{\text{test}}(X) \), puis on vérifie la solution obtenue en la comparant aux résultats de `fsolve`.

### Recherche des racines d'un polynôme dans \( \mathbb{C} \)
On applique la méthode pour trouver les racines complexes de l'équation \( x^3 = 1 \). Cela implique :
- De représenter \( \phi(x) = x^3 - 1 \) comme une fonction \( \phi : \mathbb{R}^2 \to \mathbb{R}^2 \),
- De programmer \( \phi(X) \) et son jacobien.

On vérifie que la méthode Newton-Raphson permet de retrouver les racines pour différents points de départ.

### Visualisation des bassins d'attraction
On explore les bassins d'attraction des racines de \( x^3 = 1 \) dans \( \mathbb{C} \) :
1. On discrétise une région englobant les trois racines.
2. Chaque point est associé à la racine vers laquelle l'algorithme converge.
3. On attribue un code couleur à chaque bassin et on représente les résultats graphiquement avec `pcolor`.
4. Les racines sont matérialisées sur la figure à l'aide de cercles.

### Analyse des frontières
On étudie la nature des frontières entre les bassins d'attraction pour mieux comprendre les limites de convergence de la méthode de Newton-Raphson.

## Compétences développées
- Implémentation de la méthode de Newton-Raphson dans MATLAB.
- Calcul de gradients et jacobiens pour des fonctions multi-variables.
- Résolution de systèmes non linéaires dans \( \mathbb{R}^n \).
- Visualisation et interprétation des bassins d'attraction.

## Résultats attendus
Cet exercice permet de :
- Vérifier la convergence de la méthode pour différents types de problèmes.
- Illustrer la sensibilité de la méthode au choix du point initial.
- Comprendre la structure des bassins d'attraction associés à des racines complexes.
