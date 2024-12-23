function  [g,H] = fun_test_NEWTON(x)
    g = [4* x(1) *(x(1)^2 + x(2) - 11) + 2 * (x(1) + x(2)^2 - 7);
        2*(x(1)^2 + x(2) - 11) + 4 * x(2) * (x(1) + x(2)^2 - 7)];
    H = [4 * (x(1)^2 + x(2) - 11) + 1, 4*x(1) + 4 * x(2);
        4*x(1) + 4 * x(2), 2 + 4 * (x(1) + x(2)^2 - 7) + 8 * x(2)];
end
