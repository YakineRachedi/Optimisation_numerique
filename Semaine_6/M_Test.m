w1 = -1;
w2 = 1;
b = 0;

N = 100;
x1 = rand(1,N) * 10; % 100 pour ne pas avoir 0.00
x2 = (-b - w1 * x1 ) ./ w2;
x2 = x2 + randn(1,N); % loi normal

% Initialiser le tableau des étiquettes
Y = zeros(1, N);

% Assigner les étiquettes en fonction de la position par rapport à la droite
for i = 1:N
    if x2(i) > (-b - w1.*x1(i)) / w2;% Comparer avec l'équation de la droite
        Y(i) = 1; % Au-dessus de la droite
    else
        Y(i) = 0; % En dessous de la droite
    end
end

% Stocker les points et leurs étiquettes dans des tableaux
X = [x1; x2]; % Matrice X de dimension 2xN

% Affichage des résultats
figure;
x_vals = linspace(min(x1), max(x1), 100);
y = (-b - w1 * x_vals ) ./ w2;
plot(x_vals,y, 'k', 'LineWidth', 3);
hold on;
scatter(X(1,Y == 1), X(2, Y==1), 50,'blue','filled');
scatter(X(1,Y == 0), X(2, Y==0), 50,'red','filled');
xlabel('x');
ylabel('y');
title('Points sur la droite avec décalage aléatoire');
hold off;


%la fonction csvm

fcont = @(w) csvm(Y,X,w);
w_ini = [w1;w2;b];
[W_min, fval, exitflag, output] = fmincon(@fsvm, w_ini, [], [], [], [], [], [], fcont);

W_min