function Main()
% Defines the polynomial coefficients and starting point, calls the 
% Newton-Raphson function with these parameters and finally calls 
% PlotIterations.
polynomialCoefficients = [10 -2 -1 1]; % Defines the polynomial 10 - 2x - x^2 + x^3 
startingPoint = 2;
tolerance = 0.0001;

if length(polynomialCoefficients) > 2 % Polynomial degree mustn't be < 2
   iterationValues = NewtonRaphson(polynomialCoefficients, startingPoint, tolerance);
   
   % Plot the result only if no division by zero (f''(xj) = 0) has been
   % encountered during the Newton-Raphson iterations
   if ~(ischar(iterationValues) && strcmp(iterationValues, 'Division by zero'))
       PlotIterations(polynomialCoefficients, iterationValues);
   end
   
else
   disp('The degree of the polynomial must be 2 or larger')
end