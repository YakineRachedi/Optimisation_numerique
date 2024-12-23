function [CI,CE] = csvm(Y,X,w)
    CI = 1 - Y .* (w(1) * X(1,:) + w(2) * X(2,:) + w(3));
    CE = [];
end