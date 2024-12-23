function [y,g,H] = fun_test(x)
    y = (x(1)^2 + x(2) - 11)^2 + (x(1) + x(2)^2 - 7)^ 2;
    if nargout > 1
        g = [4* x(1) *(x(1)^2 + x(2) - 11) + 2 * (x(1) + x(2)^2 - 7);
            2*(x(1)^2 + x(2) - 11) + 4 * x(2) * (x(1) + x(2)^2 - 7)];
        if nargout == 3
            H = [4 * (x(1)^2 + x(2) - 11) + 1, 4*x(1) + 4 * x(2);
                4*x(1) + 4 * x(2), 2 + 4 * (x(1) + x(2)^2 - 7) + 8 * x(2)];
        end
    end

end

% nargour renvoie le nombre de sorties demandées lorsque on appelle une fct
% [y] = fun_test(x) -> nargout sera 1 et seul y sera calculée
% [y,g] = fun_test(x) -> nargout sera 2 et y + le gradient seront calculées
% [y,g,H] = fun_test(x) -> nargout sera 3 y,g,H seront calculées