function gradient = Gradient(x1, x2, penaltyParameter)
    
    gradient = zeros(2,1);
    
    gradX1Term1 = 2 * (x1 - 1); 
    gradX1Term2 = 4 * penaltyParameter * x1 * (x1^2 + x2^2 - 1);
    gradX2Term1 = 4 * (x2 - 2); 
    gradX2Term2 = 4 * penaltyParameter * x2 * (x1^2 + x2^2 -1);
    
    if (x1^2 + x2^2 - 1) > 0
        gradient(1) = gradX1Term1 + gradX1Term2;
        gradient(2) = gradX2Term1 + gradX2Term2;
    else
        gradient(1) = gradX1Term1;
        gradient(2) = gradX2Term1;
    end
end