function alpha_k = BLS(f, xk, dk)
    % Backtracking Line Search (BLS)
    % f  : fonction prenant en entrée un point x et renvoyant la valeur et le gradient
    % xk : point courant
    % dk : direction de descente

    % Paramètres de la recherche linéaire
    delta = 0.1;  % Constante pour contrôler l'acceptation de l'itération
    omega = 1e-1; % Constante pour la condition de suffisance d'Armijo
    rho = 0.1;    % Facteur de réduction du pas entre 0 et 1
    % Calculer la valeur actuelle de la fonction et le gradient au point courant xk
    [fk, grad_fk] = f(xk);

    % Calculer la valeur initiale de alpha0
    alpha0 = (-delta * fk) / (dk' * grad_fk);  % Produit scalaire

    % Initialiser alpha avec alpha0
    alpha_j_k = alpha0;
    
    % Répéter jusqu'à ce que la condition de suffisance soit remplie
    while f(xk + alpha_j_k * dk) > fk + omega * alpha_j_k * (grad_fk' * dk)
        % Mettre à jour alpha_j+1 en réduisant le pas avec le facteur rho
        alpha_j_k = rho * alpha_j_k;
    end
    
    % Terminer avec alpha_k
    alpha_k = alpha_j_k;
end
   