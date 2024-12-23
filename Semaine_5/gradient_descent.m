function [Xstar, trajectory] = gradient_descent(f, x0, tol, NitMax)
    % Gradient Descent avec Backtracking Line Search (BLS)
    % f      : Fonction prenant un point x et renvoyant la valeur et le gradient
    % x0     : Point initial
    % tol    : Tolérance pour l'arrêt (norme du gradient)
    % NitMax : Nombre maximum d'itérations

    % Initialisation
    Xstar = x0;
    k = 0; % Compteur d'itérations
    trajectory = Xstar'; % Stocke la trajectoire des points (en tant que vecteur ligne X X)

    % Boucle principale de descente de gradient
    while norm(f(Xstar)) > tol && k < NitMax
        % Calcul du gradient au point courant
        [~, grad_fk] = f(Xstar);
        
        % Calcul de la direction de descente (opposée du gradient)
        dk = -grad_fk;
        
        % Calcul du pas optimal en utilisant la méthode Backtracking Line Search
        alpha_k = BLS(f, Xstar, dk);
        
        % Mise à jour du point
        Xstar = Xstar + alpha_k * dk;
        
        % Stocker la trajectoire
        trajectory = [trajectory; Xstar']; 
        
        % Incrémenter le compteur d'itérations
        k = k + 1;
    end
    
    % Afficher le nombre d'itérations
    fprintf('Convergence en %d itérations\n', k);
end