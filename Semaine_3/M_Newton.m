% Test Newton
% Points de départ initial

x_ini_1 = [4, 4]';
x_ini_2 = [4, -4]';
x_ini_3 = [-4, 4]';
x_ini_4 = [-4, -4]';

% Paramètres
epsilon = 1e-6;    % Tolérance
max_iter = 100;    % Nombre maximal d'itérations
[Xstar_1,fun_en_Xstar_1,iter] = Newton_Ralphson(@fun_test_NEWTON,x_ini_1,tol,NitMax)
% Affichage des résultats
fprintf('Solution trouvée en %d itérations :\n', iter);
disp('Xstar_1 =');
disp(Xstar_1);
disp('Valeur du gradient en Xstar_1 =');
disp(fun_en_Xstar_1);

[Xstar_2,fun_en_Xstar_2,iter] = Newton_Ralphson(@fun_test_NEWTON,x_ini_2,tol,NitMax)
% Affichage des résultats
fprintf('Solution trouvée en %d itérations :\n', iter);
disp('Xstar_2 =');
disp(Xstar_2);
disp('Valeur du gradient en Xstar_2 =');
disp(fun_en_Xstar_2);

[Xstar_3,fun_en_Xstar_3,iter] = Newton_Ralphson(@fun_test_NEWTON,x_ini_3,tol,NitMax)
% Affichage des résultats
fprintf('Solution trouvée en %d itérations :\n', iter);
disp('Xstar_3 =');
disp(Xstar_3);
disp('Valeur du gradient en Xstar_3 =');
disp(fun_en_Xstar_3);

[Xstar_4,fun_en_Xstar_4,iter] = Newton_Ralphson(@fun_test_NEWTON,x_ini_4,tol,NitMax)
% Affichage des résultats
fprintf('Solution trouvée en %d itérations :\n', iter);
disp('Xstar_4 =');
disp(Xstar_4);
disp('Valeur du gradient en Xstar_4 =');
disp(fun_en_Xstar_4);