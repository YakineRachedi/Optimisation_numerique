% fminunc : pour minimiser des fonctions sans contraintes
% ne renomme pas le script comme le nom de la fonction car 
% il conflit avec la fonction intégrée de MATLAB portant le même nom





% Points de départ pour la recherche des minima
x_ini_1 = [4, 4]';
x_ini_2 = [4, -4]';
x_ini_3 = [-4, 4]';
x_ini_4 = [-4, -4]';

% comparaison de nombres d'itérations si on passe pas le gradient
% ==> on met pas option comme 3eme argument
% pour avoir le nombre d'itérations il faut mettre le output sinon on
% pourra également faire l'appel avec
% [x_min_1] = fminunc(@fun_test, x_ini_1);

% Minimisation de la fonction fun_test depuis le point initial x_ini_1
[x_min_1, fval_1, exitflag_1, output_1] = fminunc(@fun_test, x_ini_1);
fprintf('Résultats pour x_ini_1:\n');
fprintf('x_min = [%f, %f]\n', x_min_1(1), x_min_1(2));
fprintf('Valeur minimale de la fonction : %f\n', fval_1);
fprintf('Nombre d''itérations : %d\n\n', output_1.iterations);

% Minimisation depuis le point initial x_ini_2
[x_min_2, fval_2, exitflag_2, output_2] = fminunc(@fun_test, x_ini_2);
fprintf('Résultats pour x_ini_2:\n');
fprintf('x_min = [%f, %f]\n', x_min_2(1), x_min_2(2));
fprintf('Valeur minimale de la fonction : %f\n', fval_2);
fprintf('Nombre d''itérations : %d\n\n', output_2.iterations);

% Minimisation depuis le point initial x_ini_3
[x_min_3, fval_3, exitflag_3, output_3] = fminunc(@fun_test, x_ini_3);
fprintf('Résultats pour x_ini_3:\n');
fprintf('x_min = [%f, %f]\n', x_min_3(1), x_min_3(2));
fprintf('Valeur minimale de la fonction : %f\n', fval_3);
fprintf('Nombre d''itérations : %d\n\n', output_3.iterations);

% Minimisation depuis le point initial x_ini_4
[x_min_4, fval_4, exitflag_4, output_4] = fminunc(@fun_test, x_ini_4);
fprintf('Résultats pour x_ini_4:\n');
fprintf('x_min = [%f, %f]\n', x_min_4(1), x_min_4(2));
fprintf('Valeur minimale de la fonction : %f\n', fval_4);
fprintf('Nombre d''itérations : %d\n\n', output_4.iterations);


%-------------------------------------------------------------------------------------------------%
%-------------------------------------------------------------------------------------------------%
%-------------------------------------------------------------------------------------------------%
%-------------------------------------------------------------------------------------------------%


% Options de l'algorithme de minimisation (utilisation de 'trust-region' avec le gradient spécifié)
options = optimoptions('fminunc','Algorithm','trust-region','SpecifyObjectiveGradient',true);

% on passe le gradient de la fonction si on passe options comme 3eme
% argument


% Minimisation de la fonction fun_test depuis le point initial x_ini_1
[x_min_1, fval_1, exitflag_1, output_1] = fminunc(@fun_test, x_ini_1, options);
fprintf('Résultats pour x_ini_1:\n');
fprintf('x_min = [%f, %f]\n', x_min_1(1), x_min_1(2));
fprintf('Valeur minimale de la fonction : %f\n', fval_1);
fprintf('Nombre d''itérations : %d\n\n', output_1.iterations);

% Minimisation depuis le point initial x_ini_2
[x_min_2, fval_2, exitflag_2, output_2] = fminunc(@fun_test, x_ini_2, options);
fprintf('Résultats pour x_ini_2:\n');
fprintf('x_min = [%f, %f]\n', x_min_2(1), x_min_2(2));
fprintf('Valeur minimale de la fonction : %f\n', fval_2);
fprintf('Nombre d''itérations : %d\n\n', output_2.iterations);

% Minimisation depuis le point initial x_ini_3
[x_min_3, fval_3, exitflag_3, output_3] = fminunc(@fun_test, x_ini_3, options);
fprintf('Résultats pour x_ini_3:\n');
fprintf('x_min = [%f, %f]\n', x_min_3(1), x_min_3(2));
fprintf('Valeur minimale de la fonction : %f\n', fval_3);
fprintf('Nombre d''itérations : %d\n\n', output_3.iterations);

% Minimisation depuis le point initial x_ini_4
[x_min_4, fval_4, exitflag_4, output_4] = fminunc(@fun_test, x_ini_4, options);
fprintf('Résultats pour x_ini_4:\n');
fprintf('x_min = [%f, %f]\n', x_min_4(1), x_min_4(2));
fprintf('Valeur minimale de la fonction : %f\n', fval_4);
fprintf('Nombre d''itérations : %d\n\n', output_4.iterations);