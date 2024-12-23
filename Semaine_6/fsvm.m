function val = fsvm(w)
    % Fonction qui calcule 1/2 * norm(w)^2
    % w : vecteur (w1, w2, b)^T
    
    % Calcul de la norme au carré
    norm_squared = sum(w.^2);
    
    % Calcul de la moitié de la norme au carré
    val = 0.5 * norm_squared;
end
