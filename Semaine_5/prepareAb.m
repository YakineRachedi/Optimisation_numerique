function [A, b] = prepareAb(h, v, dk)
    % b = gradient de f(dk)
    % A = la hessienne de f(dk)
    % opérations sur des vecteurs faut metre le .
    % attention les données doivent être des vecteurs colonne

    % Calcul de la norme pour chaque point
    norm_val = sqrt(h.^2 + dk.^2);

    % Calcul du gradient de f(dk)
    b = dk ./ (v .* norm_val);
    
    % Calcul de la diagonale de la matrice hessienne
    hess_diag = h.^2 ./ (v .* norm_val.^3);

    % Création de la matrice hessienne
    A = diag(hess_diag);

end
