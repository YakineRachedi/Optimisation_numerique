% fmincon pour la recherche de minimum sous contraintes
% nom de script =/= nom de la fonction pour pouvoir exécuter sans erreur


% minimisation sous la contrainte d'égalité x1 = x2
% Fonction objective (déjà implémenter dans fun_test)
%fun = @(x) (x(1)^2 + x(2) - 11)^2 + (x(1) + x(2)^2 - 7)^2;

% Matrice d'égalité Aeq et vecteur beq
Aeq = [1, -1]; % dans ce cas 1 seule contrainte d'égalité donc A sera une matrice de taille 1 * n 
% qui correspond à un vecteur ligne
% dans le cas général s'il y a plusieurs contraintes Aeq sera une matrice
% de taille m * n avec m le nombre des contraintes et n le nombre des variables
beq = 0; % b = 0 dans ce cas

% exp avec plusieurs contraintes, si par exemple on a 3 variables x(1) x(2) x(3)
% x(1) + x(2) = 0
% x(2) + x(3) = 1
% b = [0,1]' vecteur colone
% Aeq = [1, 1, 0
%        0, 1, 1]

% Points de départ pour la recherche des minima
x_inis = {[4, 4]', [4, -4]', [-4, 4]', [-4, -4]'};

% Boucle sur les points de départ
for i = 1:length(x_inis)
    % Appel à fmincon pour chaque point de départ
    [x_min, fval, exitflag, output] = fmincon(@fun_test, x_inis{i}, [], [], Aeq, beq);
    % [] et [] dans les arguments correspond à A et b les contraintes des
    % inégalités dans la doc, ici y on a pas
    
    % Afficher les résultats
    fprintf('Résultats pour le point de départ [%f, %f]:\n', x_inis{i}(1), x_inis{i}(2));
    fprintf('Le point optimal est : [%f, %f]\n', x_min(1), x_min(2));
    fprintf('La valeur minimale de la fonction est : %f\n', fval);
    fprintf('Nombre d''itérations : %d\n\n', output.iterations);
end

% comparaison de nombres d'itérations si on passe pas le gradient
% ==> on met option comme 3eme argument

options = optimoptions('fmincon', 'Algorithm', 'interior-point', 'SpecifyObjectiveGradient', true);
for i = 1:length(x_inis)
    % Appel à fmincon pour chaque point de départ
    [x_min, fval, exitflag, output] = fmincon(@fun_test, x_inis{i}, [], [], Aeq, beq, [], [], [], options);
    % [] et [] dans les arguments correspond à A et b les contraintes des
    % inégalités dans la doc, ici y on a pas + ub et lb
    
    % Afficher les résultats
    fprintf('Résultats pour le point de départ [%f, %f]:\n', x_inis{i}(1), x_inis{i}(2));
    fprintf('Le point optimal est : [%f, %f]\n', x_min(1), x_min(2));
    fprintf('La valeur minimale de la fonction est : %f\n', fval);
    fprintf('Nombre d''itérations : %d\n\n', output.iterations);
end

%-------------------------------------------------------------------------------------------------%
%-------------------------------------------------------------------------------------------------%
%-------------------------------------------------------------------------------------------------%
%-------------------------------------------------------------------------------------------------%


%{
lb ub : lower bound upper bound et c'est des vecteurs !  lb <= x <= ub
A la matrice des contraintes des inégalités
b second membre de l'inégalié
exp : 2x1 + 3x2 <= 10
      x1 - x2 <= 3
A = [2, 3
    1, -1] % Coefficients des contraintes linéaires
b = [10, 3] % Limites des inégalités
x = fmincon(fun,x0,A,b)
x = fmincon(fun,x0,A,b,Aeq,beq)
x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub)
x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon)
x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)
x = fmincon(problem)
[x,fval] = fmincon(___)
[x,fval,exitflag,output] = fmincon(___)
[x,fval,exitflag,output,lambda,grad,hessian] = fmincon(___)

%}

%-------------------------------------------------------------------------------------------------%
%-------------------------------------------------------------------------------------------------%
%-------------------------------------------------------------------------------------------------%
%-------------------------------------------------------------------------------------------------%


%{

A = [2, 3; 1, -1];  % Matrice des coefficients des inégalités
b = [10; 3];        % Limites des inégalités
x0 = [0; 0];        % Point initial

% Appel à fmincon
x = fmincon(@fun, x0, A, b);

%}

%-------------------------------------------------------------------------------------------------%
%-------------------------------------------------------------------------------------------------%
%-------------------------------------------------------------------------------------------------%
%-------------------------------------------------------------------------------------------------%

%{
correspond à 2x1 + 3x2 <= 0
            x1 - x2 <= 3
                x1 >= 0 (bornne inf <=> -x1 <= 0)
                x2 <= 5 (bornne sup)
A = [2, 3; 1, -1];  % Matrice des coefficients des inégalités
b = [10; 3];        % Limites des inégalités
x0 = [0; 0];        % Point initial
lb = [0; -Inf];     % Borne inférieure (x1 >= 0, pas de borne inférieure pour x2)
ub = [Inf; 5];      % Borne supérieure (x2 <= 5, pas de borne supérieure pour x1)

% Appel à fmincon avec bornes
x = fmincon(@fun, x0, A, b, [], [], lb, ub);
%}


%-------------------------------------------------------------------------------------------------%
%-------------------------------------------------------------------------------------------------%
%-------------------------------------------------------------------------------------------------%
%-------------------------------------------------------------------------------------------------%

%{ 
Une autre façon de faire ça est de définir les contraintes dans une fonction

% Définir la fonction de contrainte d'égalité + inégalité

function [c, ceq] = nonlcon(x)
    % c(x)  : Contraintes d'inégalités non linéaires
    % ceq(x): Contraintes d'égalités non linéaires
    % x     : Point courant dans l'espace des variables
    
    % Exemple de contraintes non linéaires (à ajuster selon le problème)
    c = [x(1)^2 + x(2)^2 - 1;  % x(1)^2 + x(2)^2 <= 1
         x(1) + x(2) - 1];      % x(1) + x(2) <= 1
    
    ceq = x(1) - x(2);  % x(1) - x(2) = 0 (x(1) = x(2))
end

% Appel de fmincon pour plusieurs points initiaux
[x_min_1, fval_1, exitflag_1, output_1] = fmincon(@fun_test, x_ini_1, [], [], [], [], [], [], @constraint_eq, options);
[x_min_2, fval_2, exitflag_2, output_2] = fmincon(@fun_test, x_ini_2, [], [], [], [], [], [], @constraint_eq, options);
[x_min_3, fval_3, exitflag_3, output_3] = fmincon(@fun_test, x_ini_3, [], [], [], [], [], [], @constraint_eq, options);
[x_min_4, fval_4, exitflag_4, output_4] = fmincon(@fun_test, x_ini_4, [], [], [], [], [], [], @constraint_eq, options);

% Afficher les résultats pour chaque point initial
fprintf('Résultats pour x_ini_1 = [%f, %f]\n', x_ini_1(1), x_ini_1(2));
fprintf('x_min_1 = [%f, %f]\n', x_min_1(1), x_min_1(2));
fprintf('Valeur minimale de la fonction : %f\n', fval_1);
fprintf('Nombre d''itérations : %d\n\n', output_1.iterations);

fprintf('Résultats pour x_ini_2 = [%f, %f]\n', x_ini_2(1), x_ini_2(2));
fprintf('x_min_2 = [%f, %f]\n', x_min_2(1), x_min_2(2));
fprintf('Valeur minimale de la fonction : %f\n', fval_2);
fprintf('Nombre d''itérations : %d\n\n', output_2.iterations);

fprintf('Résultats pour x_ini_3 = [%f, %f]\n', x_ini_3(1), x_ini_3(2));
fprintf('x_min_3 = [%f, %f]\n', x_min_3(1), x_min_3(2));
fprintf('Valeur minimale de la fonction : %f\n', fval_3);
fprintf('Nombre d''itérations : %d\n\n', output_3.iterations);

fprintf('Résultats pour x_ini_4 = [%f, %f]\n', x_ini_4(1), x_ini_4(2));
fprintf('x_min_4 = [%f, %f]\n', x_min_4(1), x_min_4(2));
fprintf('Valeur minimale de la fonction : %f\n', fval_4);
fprintf('Nombre d''itérations : %d\n', output_4.iterations);
%}

%-------------------------------------------------------------------------------------------------%
%-------------------------------------------------------------------------------------------------%
%-------------------------------------------------------------------------------------------------%
%-------------------------------------------------------------------------------------------------%
