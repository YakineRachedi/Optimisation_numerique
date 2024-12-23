# Approximation numérique d'une dérivée

## Objectif
Ce programme explore différentes approximations numériques de la dérivée d'une fonction mathématique donnée, en étudiant leur précision et leur comportement à travers des expériences programmées dans MATLAB.

## Description

### Initialisation de l'environnement
Dans un environnement MATLAB, on commence par initialiser les variables nécessaires pour effectuer des calculs numériques et préparer les visualisations graphiques.

### Approximations par différences finies
Deux formules sont utilisées pour approximer la dérivée d'une fonction :

- **Première formule** : 
  \[ f'(x) \approx \frac{f(x+h) - f(x)}{h} \]

- **Deuxième formule** : 
  \[ f'(x) \approx \frac{f(x+h) - f(x-h)}{2h} \]

Ces formules permettent d'approcher la dérivée d'une fonction \( f(x) \), ici spécifiquement la fonction sinus.

### Évaluation de la précision
Pour évaluer la précision des approximations, on compare leurs résultats avec la dérivée exacte \( \cos(x) \). Les erreurs maximales commises sur un intervalle donné sont calculées en utilisant des normes appropriées.

### Représentation graphique
Les dérivées approximées et exacte sont tracées sur un même graphique. Cela permet d'observer visuellement les écarts et de mieux comprendre les performances des deux approximations. Des légendes et labels sont ajoutés pour distinguer les courbes.

### Étude asymptotique
Le comportement des erreurs est analysé en fonction de la taille du pas \( h \). Des graphiques logarithmiques mettent en évidence les tendances asymptotiques des erreurs des deux méthodes. Les résultats sont ensuite superposés avec les droites correspondant aux comportements théoriques attendus.

### Approfondissement
Une approximation d'ordre supérieur de la dérivée est également étudiée :

\[
  f'(x) \approx \frac{4}{3}\frac{f(x+h) - f(x-h)}{2h} - \frac{1}{3}\frac{f(x+2h) - f(x-2h)}{4h}
\]

L'ordre d'approximation est vérifié numériquement à l'aide des développements de Taylor.

## Compétences développées
- Manipulation de MATLAB pour effectuer des calculs numériques et tracer des graphiques.
- Analyse de la précision des méthodes d'approximation numérique.
- Visualisation et interprétation des résultats obtenus.
- Utilisation des séries de Taylor pour valider des schémas numériques.

## Résultats attendus
Les expériences menées permettent de :
- Quantifier les erreurs des approximations par différences finies.
- Identifier les limites des méthodes simples et les avantages des schémas d'ordre supérieur.
- Comprendre le lien entre la taille du pas \( h \) et la précision des résultats.