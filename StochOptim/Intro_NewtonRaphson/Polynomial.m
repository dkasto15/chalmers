function valueOfPolynomial = Polynomial(x, polynomialCoefficients)
% Takes x and the n+1 coefficients of an n:th-degree polynomial a0, a1, ...,
% an as input and returns the value f(x) = a0 + a1*x + ... + an*x^n
    lengthOfPolynomialCoefficients = length(polynomialCoefficients);
    tmpSum = 0;
    for i = 1:lengthOfPolynomialCoefficients
        tmpSum = tmpSum + polynomialCoefficients(i) * x^(i-1);
    end
    valueOfPolynomial = tmpSum;
end