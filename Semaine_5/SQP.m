function [d_opt, k] = SQP(h, D, v, tol, k_max)
    
    % Initialisation
    dk = D * h./sum(h);  % Initialisation de d^0
    %dk
    k = 0;  % Compteur d'itérations
    delta = ones(size(h));  % Delta de la taille de h
    C = ones(1, length(dk));  % Vecteur ligne pour la somme des delta

    % Boucle SQP
    while norm(delta) > tol & k <= k_max
        
        % Calcul de f(dk), ∇f(dk), Hf(dk)        
        [H_f_k,grad_f_k] = prepareAb(h,v,dk);
        % Résolution du sous-problème quadratique linéaire
        %H_f_k
        %grad_f_k
        % Contrainte d'égalité : sum(delta) = D - sum(d_k)
        d_contrainte = D - sum(dk);  % Scalaire représentant la différence de somme
        [delta, ~] = KKT_quad_lin(H_f_k, grad_f_k, C, d_contrainte);
        %delta
        % Mise à jour de dk
        dk = dk + delta;
        %dk
        
        % Incrémenter le compteur
        k = k + 1;
    end
    
    % Sortie
    d_opt = dk;
end