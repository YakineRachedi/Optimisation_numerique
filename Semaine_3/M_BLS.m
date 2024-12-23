xk = [-1.2,1];
[~,dk] = fun_test(xk);
alpha_k = BLS(@fun_test,xk,dk);
alpha_k

