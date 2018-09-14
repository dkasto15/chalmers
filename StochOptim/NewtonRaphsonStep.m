function xNew = NewtonRaphsonStep(xCurrent, firstDerivativeValue, secondDerivativeValue)
% Carries out a Newton-Raphson iteration step, taking three inputs, xj, 
% f′(xj), and f′′(xj), and returning x(j+1).
    xNew = xCurrent - firstDerivativeValue / secondDerivativeValue;
end