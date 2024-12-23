function [Xstar,Gstar,iter] = Newton_Ralphson(G,X0,eps,max_iter)
    % Yakine Rachedi
    % arguments d’appel
    % G : identifiant de la fonction de R^n dans R^n dont on cherche la racine
    % la syntaxe d’appel est [Y,J]=G(X) avec Y (vecteur de R^n) la valeur
    %. de la fonction G en X (vecteur de R^n) et J sa matrice jacobienne (nxn) en X
    % X0 : vecteur de R^n, point de depart pour l’algorithme de Newton-Ralphson
    % eps : tolerance pour la convergence
    % max_iter : nombre maximum d’iterations
    % arguments de sortie
    % Xstar : valeur de la racine trouvee par Newton-Ralphson
    % Gstar : valeur de la fonction G en Xstar
    % iter : nombre d’iterations effectuees
    
    Xstar = X0;  % Initialisation de la racine estimée
    iter = 0;    % Compteur d'itérations
    [Y, J] = G(Xstar);  % Calcul initial de la fonction G et de la jacobienne J en Xstar
    
    while iter < max_iter && norm(Y) > eps
        % Résolution du système linéaire J * dk = Y
        dk = linsolve(J, Y);  % Trouver la direction de descente en résolvant J * dk = Y
        Xstar = Xstar - dk;   % Mise à jour de Xstar
        
        % Recalculer G(Xstar) et la jacobienne J(Xstar) après la mise à jour
        [Y, J] = G(Xstar);
        
        iter = iter + 1;  % Incrémenter le compteur d'itérations
    end
    Gstar = Y;  % Valeur de la fonction G en Xstar à la fin

    % NB : Ne compile pas ce fichier
end
