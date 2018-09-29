function xOptimum = GradientDescent(x0, penaltyParameter, stepLength, threshold)
    
    xj = x0; 
    while norm(Gradient(xj(1), xj(2), penaltyParameter)) >= threshold
        gradient = Gradient(xj(1), xj(2), penaltyParameter);
        xj(1) = xj(1) - stepLength * gradient(1);
        xj(2) = xj(2) - stepLength * gradient(2);
    end
    xOptimum = xj; 
end