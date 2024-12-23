function [T, Grad_T] = Traject_time(v, h, d, D)
    % Fonction pour calculer le temps total de trajet T et son gradient.
    % d : vecteur des déviations d_1 à d_{n-1}
    % v : vecteur des vitesses dans les couches
    % D : déviation horizontale totale imposée
    %
    % Retourne :
    % T : la valeur de T pour les déviations d
    % Grad_T : le gradient de T par rapport à d_1, d_2, ..., d_{n-1}

    n = length(h);  % Nombre de couches
    d_n = D - sum(d);  % Calcul de d_n à partir de la contrainte

    % Calcul de T
    T = sum(sqrt(d(1:n-1).^2 + h(1:n-1).^2) ./ v(1:n-1)) + sqrt(d_n^2 + h(n)^2) / v(n);
    % Calcul du gradient
    Grad_T = d ./ (v.* sqrt(d.^2 + h.^2)); % Gradient pour les d_i

    % Ajustement du gradient en fonction de la contrainte
    Grad_T = Grad_T - (D - sum(d(1:n-1))) ./ (v(n) * sqrt(D - sum(d(1:n-1).^2) + h(n)^2)); 
end