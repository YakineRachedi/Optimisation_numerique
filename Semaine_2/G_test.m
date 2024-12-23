function [Y,J] = G_test(X)
    % Yakine Rachedi
    % arguments d’appel
    % X : vecteur colonne de R^2
    % arguments de sortie
    % Y : vecteur colonne de R^2, valeur de G_test(X)
    % J : matrice 2x2, valeur de JG_test(X)

    Y = [ 2 * (X(1) - 1); 4 * (X(2) - 2) ^ 3]; % Calcul de Y : un vecteur colonne
    J = [2, 0 ; 0 , 12 * (X(2) - 2)^2]; % Calcul de la jacobienne J


    % NB : Ne compile pas ce fichier
end