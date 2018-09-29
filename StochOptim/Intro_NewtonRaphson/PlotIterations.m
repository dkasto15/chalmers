function PlotIterations(polynomialCoefficients, iterationValues)
% Plots the polynomial as well as the iterates (as circles) xj, j = 0, 1,...
    FIGURE_PADDING_FACTOR = 0.1;
    xMin = min(iterationValues) * (1 + FIGURE_PADDING_FACTOR);
    xMax = max(iterationValues) * (1 + FIGURE_PADDING_FACTOR);
    x = linspace(xMin, xMax);
    
    % Calculate polynomial y-values
    lengthX = length(x);
    polynomialValues = zeros(lengthX, 1);
    for i = 1:lengthX
        polynomialValues(i) = Polynomial(x(i), polynomialCoefficients);
    end
    
    % Calculate polynomial y-values for the iterate x-values
    lengthIterates = length(iterationValues);
    polynomialIterateValues = zeros(lengthIterates, 1);
    for i = 1:lengthIterates
        polynomialIterateValues(i) = Polynomial(iterationValues(i), polynomialCoefficients);
    end
    
    yDifference = max(polynomialValues) - min(polynomialValues);
    yMin = min(polynomialValues) - FIGURE_PADDING_FACTOR * yDifference;
    yMax = max(polynomialValues) + FIGURE_PADDING_FACTOR * yDifference;
    
    plot(x, polynomialValues)
    hold on
    plot(iterationValues, polynomialIterateValues, 'o')
    
    axis([xMin xMax yMin yMax])
end