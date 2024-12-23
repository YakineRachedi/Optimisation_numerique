% M_traject_time.m
d = [1; 2; 1.5; 0.5];  % Déviations d_1, d_2, ..., d_{n-1}
h = [1.06; 1.68; 1.04; 1.3];  % Hauteurs des couches h_1, h_2, h_3
v = [1.2; 1.5; 1.3; 1.8];  % Vitesses dans les couches v_1, v_2, v_3
D = 10.0;  % Déviation totale imposée

% Appel de la fonction
[T, Grad_T] = Traject_time(v, h, d, D);

% Affichage des résultats
disp('T =');
disp(T);
disp('Gradient de T = ');
disp(Grad_T)

% Définir la fonction anonyme
f = @(d) Traject_time(v, h, d, D); % faut faire ça pour passer n'importe quelle fonction dans une autre fonction

[Xstar, ~] = gradient_descent(f, d, 1e-6, 1000);

% Affichage des résultats
disp('Solution optimale Xstar =');
disp(Xstar);

