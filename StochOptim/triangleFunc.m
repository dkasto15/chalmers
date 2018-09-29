f = @(x) 4*x(1).^2 - x(1)*x(2) + 4*x(2).^2 - 6*x(2);

x1 = [6/63, 48/63]';
x2 = [0, 6/8]';
x3 = [1/8, 1]';
x4 = [6/14, 6/14]';
x5 = [0, 0]';
x6 = [0, 1]';
x7 = [1, 1]';

X = [x1, x2, x3, x4, x5, x6, x7];
lenX = length(X);
fVal = zeros(7,1);
for i=1:lenX
    x = X(:, i);
    fVal(i) = f(x);
end
X
round(fVal,3)