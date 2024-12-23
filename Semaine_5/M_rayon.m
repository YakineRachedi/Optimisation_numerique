% les programmes qui ne sont pas des fonctions doivent s'appeller M_nom.m
clear
close all

% Définition des vecteurs h, d, et v
h = [1.06; 1.68; 1.04; 1.3];
d_initial = [1; 2; 1.5; 0.5];  % Initialisation pour SQP
v = [1.2; 1.5; 1.3; 1.8];
%trace(d_initial,h)
% Paramètres pour la méthode SQP
D = 10;          % Contrainte (exemple de valeur)
tol = 1e-6;      % Tolérance
k_max = 100;     % Nombre maximal d'itérations

%{
test : KKT_quad_lin
[A,b] = prepareAb(h,v, d_initial)
C = ones(size(A, 1), 1)';  % Crée un vecteur ligne (pour KKT_quad_lin) 
                                            %de 1 avec autant de lignes que A
[X,Y] = KKT_quad_lin(A,b,C,0);
X
Y
%}


% Appel de la fonction SQP pour trouver la solution optimale
[d_opt, k] = SQP(h, D, v, tol, k_max);

% Affichage des résultats
disp('Solution optimale d_opt obtenue par la méthode SQP :');
disp(d_opt);
disp('Nombre d''itérations :');
disp(k);

trace(d_opt,h)