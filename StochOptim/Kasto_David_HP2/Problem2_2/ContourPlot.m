clear all;
close all;

rangeMax = 5; 
rangeMin = -5;
numberOfDataPoints = 5000;
logConstant = 0.01;

x = linspace(rangeMin, rangeMax, numberOfDataPoints);
y = linspace(rangeMin, rangeMax, numberOfDataPoints);
[X,Y] = meshgrid(x,y);

f1 = (X.^2 + Y - 11).^2;
f2 = (X + Y.^2 - 7).^2;
functionValue = f1 + f2;
logValue = log(logConstant + functionValue);

figure(1)
contour(X,Y,logValue)