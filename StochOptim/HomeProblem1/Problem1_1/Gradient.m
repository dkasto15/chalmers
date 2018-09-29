function gradient = Gradient(x1, x2, penaltyParameter)
    
    gradient = zeros(2,1);
    
    gradientX1Term1 = 2 * (x1 - 1); 
    gradientX1Term2 = 4 * penaltyParameter * x1 * (x1^2 + x2^2 - 1);
    gradientX2Term1 = 4 * (x2 - 2); 
    gradientX2Term2 = 4 * penaltyParameter * x2 * (x1^2 + x2^2 - 1);
    
    if (x1^2 + x2^2 - 1) > 0
        gradient(1) = gradientX1Term1 + gradientX1Term2;
        gradient(2) = gradientX2Term1 + gradientX2Term2;
    else
        gradient(1) = gradientX1Term1;
        gradient(2) = gradientX2Term1;
    end
end