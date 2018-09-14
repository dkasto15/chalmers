x1 = [-1, -1, -1, -1, -1, 1, 1, -1, -1]';
x2 = [-1, -1, 1, -1, -1, -1, -1, 1, -1]';
x3 = [-1, -1, -1, -1, -1, 1, -1, -1, -1]';
X = [x1, x2, x3];

W = zeros(9);

for i=1:9
    for j=1:9
        sum = 0;
        for mu = 1:2
            sum = sum + X(i, mu) * X(j, mu);
        end
        W(i,j) = 1/9 * sum;
    end
end

y = zeros(9,1);
mu = 3; 
for i = 1:9
    sum = 0;
    for j = 1:9
        sum = sum + W(i,j) * X(j, mu);
    end
    y(i) = sign(sum);
    if y(i) == 0
        y(i) = 1;
    end 
end
y'