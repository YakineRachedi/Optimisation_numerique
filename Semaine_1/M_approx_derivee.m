% Yakine RACHEDI
clear % désaffecte les variables
close all % ferme les fenêtres graphiques

h = 0.00001;  % Ajustement de h
dx = pi / 100;
x = linspace(0, pi, 101);

% Dérivée exacte :
d = cos(x);

% Dérivée approchée (1ère formule) :
d1 = (sin(x + h) - sin(x)) / h;

err = norm(d - d1, inf); % Calcul de l'erreur maximale avec la norme infinie
fprintf("Le résultat de l'erreur maximale par la 1ère formule est : %.4e\n", err);

% Dérivée approchée (2ème formule, différences centrées) :
d2 = (sin(x + h) - sin(x - h)) / (2 * h); % attention aux parentheses

err_2 = norm(d - d2, inf);
fprintf("Le résultat de l'erreur maximale par la 2ème formule est : %.4e\n", err_2);

% Créer une figure
figure('Position', [100, 100, 1200, 400]);  % Taille plus grande pour les sous-graphes

% Premier graphe - Dérivée exacte
subplot(1,3,1)
plot(x, d, '-g', 'LineWidth', 1.5)
xlabel('x')
ylabel('x --> cos(x)')
title('Graphe de la dérivée exacte')
grid on

% Deuxième graphe - Dérivée approchée (1ère formule)
subplot(1,3,2)
plot(x, d1, '-r', 'LineWidth', 1.5)
xlabel('x')
ylabel('1ere formule')
title('Graphe de la dérivée approchée')
grid on

% Troisième graphe - Dérivée approchée (2ème formule)
subplot(1,3,3)
plot(x, d2, '-k', 'LineWidth', 1.5)
xlabel('x')
ylabel('2eme formule')
title('Graphe de la dérivée approchée')
grid on

figure; % Crée une nouvelle figure
h = logspace(-10,-1,10);

E1 = zeros(1,length(h));
E2 = zeros(1,length(h));

for i = 1:length(h)
    [E1(i), E2(i)] = max_error(h(i)); % Récupération des deux erreurs
end

% Affichage des erreurs
E1
E2

% Graphe 1 - Erreur par la 1ère formule
subplot(1,2,1)
loglog(h, E1, '-ro', 'MarkerFaceColor', 'r')  % '-ro' pour les lignes rouges avec des cercles rouges remplis
xlabel('h')
ylabel('Erreur 1')
title("L'erreur par la 1ère formule")
grid on

% Graphe 2 - Erreur par la 2ème formule
subplot(1,2,2)
loglog(h, E2, '-bs', 'MarkerFaceColor', 'b')  % '-bs' pour les lignes bleues avec des carrés bleus
xlabel('h')
ylabel('Erreur 2')
title("L'erreur par la 2ème formule")
grid on

% on remarque que la 2eme formule donne une petite erreur

figure; % Crée une nouvelle figure
% Préallocation pour les erreurs
E3 = zeros(1, length(h));

% Calcul des erreurs pour chaque h(i)
for i = 1:length(h)    
    % Dérivée approchée (formule 3)
    d3 = (4 / 3) * ((sin(x + h(i)) - sin(x - h(i))) ./ (2 * h(i))) - ...
         (1 / 3) * ((sin(x + 2 * h(i)) - sin(x - 2 * h(i))) ./ (4 * h(i)));
     
    % Calcul de l'erreur maximale
    E3(i) = norm(d - d3, inf);
end

% Tracé de l'erreur avec loglog
loglog(h, E3, '-go', 'MarkerFaceColor', 'g');  % '-go' pour lignes vertes avec cercles verts remplis
xlabel('h');
ylabel('Erreur');
title('Erreur pour la formule d''approximation d''ordre 4');
grid on;