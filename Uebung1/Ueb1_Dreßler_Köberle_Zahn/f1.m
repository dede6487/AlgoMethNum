function [f] = f1(x)
    if x == 1
        f = 3;
    else
        y = x*x*x;
        f = (y-1)/(x-1);
    end