x(1) = 0;
x(2) = -1;

a1 = (x(1) + x(2) + 1)^2;
a2 = 19 - 14*x(1) + 3*x(1)^2 - 14*x(2) + 6*x(1)*x(2) + 3*x(2)^2;
a1prim = 2 * (x(1) + x(2) + 1);
a2prim = - 14*x(1) + 6*x(1)+ 6*x(2);

a = 1 + a1 * a2;
aprim = a1prim * a2 + a1 * a2prim;

b1 = (2*x(1) - 3*x(2))^2;
b2 = 18 - 32*x(1) + 12*x(1)^2 + 48*x(2) - 36*x(1)*x(2) + 27*x(2)^2;
b1prim = 4*(2*x(1) - 3*x(2));
b2prim = -32 + 24*x(1) - 36*x(2);

b = 30 + b1 * b2;
bprim = b1prim * b2 + b1 * b2prim;

dg_dx1 = a * bprim + aprim * b;

c = a;
cprim = aprim; 

d = b; 
d1 = b1;
d2 = b2;
d1prim = -6*(2*x(1) - 3*x(2));
d2prim = 48 - 36*x(1) + 54*x(2);

dprim = d1prim * d2 + d1 * d2prim;

dg_dx2 = c * dprim + cprim * d;