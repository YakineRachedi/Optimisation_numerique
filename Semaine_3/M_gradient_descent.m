% Test de la fonction gradient_descent

x_ini_1 = [1.2,1.2]';
x_ini_2 = [-1.2,1]';
tol = 1e-4;
NitMax = 100;

% c'est pas correct car MATLAB attend une fonction comme input
%[y,g] = fun_test(x_ini);
%[Xstar] = gradient_descent(g, x_ini, rho, tol, NitMax);

% Passer la fonction anonyme @(x) pour calculer le gradient via fun_test
[Xstar] = gradient_descent(@(x) fun_test(x), x_ini_1, tol, NitMax);
fprintf("Le minimum trouvé (pour le point initial [1.2, 1.2]): [%f, %f]\n", Xstar);


[Xstar] = gradient_descent(@(x) fun_test(x), x_ini_2, tol, NitMax);
fprintf("Le minimum trouvé (pour le point initial [-1.2, 1]): [%f, %f]\n", Xstar);



% Tracer les isovaleurs de la fonction f
[X1, X2] = meshgrid(-5:0.1:5, -5:0.1:5);
Z = (X1.^2 + X2 - 11).^2 + (X1 + X2.^2 - 7).^2;
contour(X1, X2, Z, 50); % Tracer les courbes de niveau
hold on;

% Initialiser le point de départ
x_ini_1 = [4, 4]';
x_ini_2 = [4, -4]';
x_ini_3 = [-4, 4]';
x_ini_4 = [-4, -4]';
tol = 1e-4;
NitMax = 1000;

[Xstar_1, trajectory_1] = gradient_descent(@fun_test, x_ini_1, tol, NitMax);
[Xstar_2, trajectory_2] = gradient_descent(@fun_test, x_ini_2, tol, NitMax);
[Xstar_3, trajectory_3] = gradient_descent(@fun_test, x_ini_3, tol, NitMax);
[Xstar_4, trajectory_4] = gradient_descent(@fun_test, x_ini_4, tol, NitMax);

% Superposer la trajectoire de la descente de gradient
scatter(trajectory_1(:, 1), trajectory_1(:, 2), 50, 'filled'); 
hold on
scatter(trajectory_2(:, 1), trajectory_2(:, 2), 50, 'filled');
hold on
scatter(trajectory_3(:, 1), trajectory_3(:, 2), 50, 'filled');
hold on
scatter(trajectory_4(:, 1), trajectory_4(:, 2), 50, 'filled');
title('Trajectoire de la descente de gradient avec BLS');
xlabel('x1');
ylabel('x2');
hold off;