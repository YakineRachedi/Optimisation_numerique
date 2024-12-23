A = 2*eye(2);
b = zeros(2,1);
C = ones(1,2);
d = -1;
[X,Y] = KKT_quad_lin(A,b,C,d)