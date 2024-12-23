function [Y,J] = phi(X)
    % Yakine Rachedi
    % arguments d’appel
    % X : vecteur colonne de R^2
    % arguments de sortie
    % Y : vecteur colonne de R^2, valeur de phi(X)
    % J : matrice 2x2, valeur de la jacobienne de phi(X)

    Y = [X(1)^3 - 3*X(1) * X(2)^2 - 1; 3*X(1)^2 * X(2) - X(2)^3];
    J = [3*X(1)^2 - 3*X(2)^2, -6*X(1)*X(2); 6*X(1)*X(2),3*X(1)^2 - 3*X(2)^2];

    % NB : Ne compile pas ce fichier
end