% Yakine Rachedi
% Fichier à compiler !
% Programme implémentant la méthode de Newton-Raphson pour trouver les racines
% d'une fonction G avec sa jacobienne.

clear  % Désaffecte les variables
close all  % Ferme toutes les fenêtres graphiques

% Initialisation des paramètres :
X0 = [0; 0];  % Point de départ
X1 = [1; 1];    % Point de départ proche de la solution (1, 0)
X2 = [0.5; -1]; % Autre point de départ
X3 = [-1; 0.5]; % Autre point de départ
eps = 0.001;  % Tolérance pour la convergence
max_iter = 100;  % Nombre maximum d'itérations

% Exécution de l'algorithme de Newton-Raphson
fprintf("Lancement de l'algorithme de Newton-Raphson...\n");
[Xstar, Gstar, iter] = Newton_Ralphson(@G_test, X0, eps, max_iter);

% Affichage des résultats
fprintf("Résultats :\n");
fprintf("La racine trouvée est Xstar = [%.4f; %.4f]\n", Xstar(1), Xstar(2));
fprintf("Valeur de la fonction en Xstar (Gstar) = [%.4f; %.4f]\n", Gstar(1), Gstar(2));
fprintf("Nombre d'itérations effectuées : %d\n", iter);


% Rem : dans cette exemple il est clair que le min est (1,2), dans ce cas
% en cours on a dit que la convergence est quadratique, mais pas dans cette
% exemple car en fait, la matrice jacobienne n'est pas inversible en (1,2)



% Premier point de départ (X1)
fprintf('\nRésultats avec le point de départ X1 = [1; 1]:\n');
[Xstar_phi_1, Gstar, iter] = Newton_Ralphson(@phi, X1, eps, max_iter);
fprintf("Nombre d'itérations effectuées : %d\n", iter);
Xstar_phi_1;

% Deuxième point de départ (X2)
fprintf('\nRésultats avec le point de départ X2 = [0.5; -1]:\n');
[Xstar_phi_2, Gstar, iter] = Newton_Ralphson(@phi, X2, eps, max_iter);
fprintf("Nombre d'itérations effectuées : %d\n", iter);
Xstar_phi_2;

% Troisième point de départ (X3)
fprintf('\nRésultats avec le point de départ X3 = [-1; 0.5]:\n');
[Xstar_phi_3, Gstar, iter] = Newton_Ralphson(@phi, X3, eps, max_iter);
fprintf("Nombre d'itérations effectuées : %d\n", iter);
Xstar_phi_3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 3 :
% Test pour trouver les racines de la fonction phi

% Les solutions de x^3 = 1 sont 1, exp(2i*pi/3), et exp(-2i*pi/3).
% Proposons des points de départ proches de ces solutions en coordonnées cartésiennes :
fprintf("Résultats pour la solution de l'équation x^3 = 1:\n");

% Définissons des points de départ proches des solutions possibles
fprintf("Lancement de l'algorithme de Newton-Raphson...\n");

% 1ère solution (réelle) : point de départ proche de (1,0)
X4 = [1.1; 0]; % Petit écart vers 1
fprintf('\nRésultats pour la solution réelle (1,0) avec le point de départ X4 = [1.1; 0]:\n');
[Xstar_phi_4, Gstar, iter] = Newton_Ralphson(@phi, X4, eps, max_iter);
fprintf("Solution trouvée : %d\n",Xstar_phi_4)
fprintf("Nombre d'itérations effectuées : %d\n", iter);


% 2ème solution (complexe) : point de départ proche de exp(2i*pi/3)
X5 = [-0.5; 0.87]; % Environ (cos(120°), sin(120°))
fprintf('\nRésultats pour la solution complexe exp(2i*pi/3) avec le point de départ X5 = [-0.5; 0.87]:\n');
[Xstar_phi_5, Gstar, iter] = Newton_Ralphson(@phi, X5, eps, max_iter);
fprintf("Solution trouvée : %d\n",Xstar_phi_5)
fprintf("Nombre d'itérations effectuées : %d\n", iter); % diverge


% 3ème solution (complexe) : point de départ proche de exp(-2i*pi/3)
X6 = [-0.5; -0.87]; % Environ (cos(-120°), sin(-120°))
fprintf('\nRésultats pour la solution complexe exp(-2i*pi/3) avec le point de départ X6 = [-0.5; -0.87]:\n');
[Xstar_phi_6, Gstar, iter] = Newton_Ralphson(@phi, X6, eps, max_iter);
fprintf("Solution trouvée : %d\n",Xstar_phi_6)
fprintf("Nombre d'itérations effectuées : %d\n", iter); % ça diverge ici


% autres testes :
X7 = [1;1];
X8 = [0.5;-1];
X9 = [-1;-1];

[Xstar_phi_7, Gstar, iter] = Newton_Ralphson(@phi, X7, eps, max_iter);
fprintf("Solution trouvée pour le point de départ [1;1]: %d\n",Xstar_phi_7);
fprintf("Nombre d'itérations effectuées : %d\n", iter);

[Xstar_phi_8, Gstar, iter] = Newton_Ralphson(@phi, X8, eps, max_iter);
fprintf("Solution trouvée le point de départ [0.5;-1]: %d\n",Xstar_phi_8);
fprintf("Nombre d'itérations effectuées : %d\n", iter);

[Xstar_phi_9, Gstar, iter] = Newton_Ralphson(@phi, X9, eps, max_iter);
fprintf("Solution trouvée le point de départ [-1;-1]: %d\n",Xstar_phi_9);
fprintf("Nombre d'itérations effectuées : %d\n", iter);


% Visualisation des bassins d'attraction de la fonction g

clear;
close all;

% Paramètres de la grille
N = 100; % Résolution de la grille (2N x 2N)
w = 2; % Définir la zone de [-w, w] x [-w, w]
h = 1.5 / N; % le pas
eps = 1e-6; % Tolérance pour Newton-Raphson
max_iter = 100; % Nombre maximum d'itérations

% Initialisation de la matrice des couleurs
C = zeros(2*N - 1, 2*N - 1);

% Racines connues de la fonction phi (calculées à la main)
r1 = [1; 0];
r2 = [-1/2; sqrt(3)/2];
r3 = [-1/2; -sqrt(3)/2];

racines = [r1, r2, r3];

% Boucle pour chaque point de la grille
for i = 1:2*N-1
    for j = 1:2*N-1
        % Calculer x_i et y_j dans [-w, w]
        x_i = -w + w * (i - 0.5) / N;
        y_j = -w + w * (j - 0.5) / N;
        
        % Point de départ pour Newton-Raphson
        X0 = [x_i; y_j];
        
        % Appliquer l'algorithme de Newton-Raphson
        [Xstar, ~, ~] = Newton_Ralphson(@phi, X0, eps, max_iter);
        
        % Trouver la racine la plus proche
        distances = vecnorm(racines - Xstar, 2, 1); % Distances aux racines, attention il faut une norme vectorielle (vecnorm)
        [~, k] = min(distances); % Trouver l'indice de la racine la plus proche
        
        % Affecter une couleur à l'élément C(i,j)
        C(i, j) = k;
    end
end

% Créer la grille
grille = linspace(-w, w, 2*N-1);

% Visualiser la matrice avec pcolor
figure;
pcolor(grille, grille, C');
shading flat;
hold on;

% Ajouter les racines sur la figure
plot(racines(1,:), racines(2,:), 'ro', 'MarkerSize', 10, 'LineWidth', 2);
hold off;