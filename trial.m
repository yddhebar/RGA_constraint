%..understanding non uniform mapping..
eta = 0;
p = 0.5;
a = 0;
x_b = 1;
b = 2;

xL = a + (x_b - a)*((1-p)^(1/(1+eta)));
xR = b - (b - x_b)*(p^(1/(1+eta)));

dL = (x_b - xL)/(x_b - a)
dR = (xR - x_b)/(b - x_b)
