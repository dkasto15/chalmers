function iterates = NewtonRaphson(polynomialCoefficients,...
    startingPoint, tolerance)
% Implementation of the Newton-Raphson algorithm. Takes the n+1 coefficients
% of an nth-degree polynomial a0, a1, ..., an, a starting point (x0) and an
% absolute tolerance parameter (for checking convergence) as input and 
% returns a vector containing the iterates xj with the stationary point as 
% the last element in that vector.
    firstDerivativeCoefficients = PolynomialDifferentiation(polynomialCoefficients, 1);
    secondDerivativeCoefficients = PolynomialDifferentiation(polynomialCoefficients, 2);
    
    iterates = startingPoint;
    aboveTolerance = true; 
    while aboveTolerance  
        firstDerivativeValue = Polynomial(iterates(end), firstDerivativeCoefficients); 
        secondDerivativeValue = Polynomial(iterates(end), secondDerivativeCoefficients); 
        
        if secondDerivativeValue ~= 0
            xNew = NewtonRaphsonStep(iterates(end), firstDerivativeValue, secondDerivativeValue);
            iterates = [iterates, xNew]; 
            aboveTolerance = abs(iterates(end) - iterates(end - 1)) >= tolerance; 
        
        % If f''(xj) = 0, division by zero would occur. An error message
        % should then be displayed and the program should be terminated.
        else
            fprintf(['Error in NewtonRaphson.m: The second derivative (f′′(xj))',... 
            ' of the given polynomial\nevaluated in the point xj = ',... 
            num2str(iterates(end)), ' is equal to zero, thus yielding division by',...
            ' zero\nin the calculation of the next Newton-Raphson iteration step.\n'])
            % Set iterates to a string so Main.m can recognize and handle 
            % the error
            iterates = 'Division by zero'; 
            return
        end
    end
end