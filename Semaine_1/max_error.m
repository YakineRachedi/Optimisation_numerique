function [e1, e2] = max_error(h)
    x = linspace(0, pi, 101);
    % Dérivée exacte :
    d = cos(x);
    
    % Dérivée approchée (1ère formule) :
    d1 = (sin(x + h) - sin(x)) / h;
    e1 = norm(d - d1, inf); % Calcul de l'erreur maximale avec la norme infinie
    
    % Dérivée approchée (2ème formule, différences centrées) :
    d2 = (sin(x + h) - sin(x - h)) / (2 * h);
    e2 = norm(d - d2, inf); % Erreur maximale pour la 2ème formule
end