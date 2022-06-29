function [a] = ub(x, y)

a = x*(1-x)*y*(1-y)^2+sin(15*pi*x)*sin(pi*y);

end