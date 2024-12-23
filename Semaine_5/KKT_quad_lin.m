% KKT-quad-lin
function [x,lambda] = KKT_quad_lin(A,b,C,d)
    % A une matrice
    % b vecteur colone
    % C vecteur ligne
    % d point ou vecteur colone (pas sur)
    [m, n] = size(C);
    % m : nombre de lignes
    % n : nombre de colonnes
    zeros_matrix = zeros(m, m); % Matrice de zéros mxm
    M = [A, C'; C, zeros_matrix];
    N = [-b;d];
    SOL = linsolve(M,N);
    x = SOL(1:n);
    lambda = SOL(n+1:n+m);
end

% RQ : tu peux pas prendre C comme une matrice car c'est pas linéaire
