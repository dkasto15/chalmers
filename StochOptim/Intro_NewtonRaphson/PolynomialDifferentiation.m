function derivativeCoefficients = PolynomialDifferentiation(polynomialCoefficients,...
    orderOfDerivative)
% Takes the n+1 coefficients of an nth-degree polynomial a0, a1, ...,
% an and the order k of the derivative as input and returns the n+1-k 
% coefficients of the k:th derivative of the polynomial.
    lengthOfPolynomialCoefficients = length(polynomialCoefficients);
	nbrOfElementsInOutput = lengthOfPolynomialCoefficients - orderOfDerivative;
    if nbrOfElementsInOutput > 0
        derivativeCoefficients = zeros(nbrOfElementsInOutput, 1);
        for i = 1:nbrOfElementsInOutput
            % Multiply each coefficient by its order for each
            % differentiation. Take into account that the order decreases
            % by one after each differentiation. 
            totalDifferentiationFactor = 1;
            for j = 1:orderOfDerivative
                totalDifferentiationFactor = totalDifferentiationFactor...
                    * (orderOfDerivative + i - j);
            end
            derivativeCoefficients(i) = polynomialCoefficients(orderOfDerivative + i)...
                * totalDifferentiationFactor;
        end
    else
        derivativeCoefficients = [];
    end
end