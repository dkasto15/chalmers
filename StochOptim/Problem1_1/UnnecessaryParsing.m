    nbrOfSpacesOutputTable = 10;



% Parse and print output data
    stringWithPenaltyParameters = sprintf('%d', penaltyParameterVector(1));
    stringWithX1Optimum = sprintf('%.3f', xOptimum(1,1));
    stringWithX2Optimum = sprintf('%.3f', xOptimum(2,1));
    
    for i = 2:lenPenaltyParameter
        mu = penaltyParameterVector(i);
        x1Optimum = xOptimum(1, i);
        x2Optimum = xOptimum(2, i);
        
        lengthOfMuString = length(num2str(mu));
        penaltySpacing = nbrOfSpacesOutputTable - lengthOfMuString + 2;
        spacingStringPenalty = blanks(penaltySpacing);
        spacingStringX = blanks(nbrOfSpacesOutputTable - 4);
        

        stringWithPenaltyParameters = sprintf('%s%s%d',...
            stringWithPenaltyParameters, spacingStringPenalty, mu);
        stringWithX1Optimum = sprintf('%s%s%.3f',...
            stringWithX1Optimum, spacingStringX, x1Optimum);
        stringWithX2Optimum = sprintf('%s%s%.3f',...
            stringWithX2Optimum, spacingStringX, x2Optimum);
    end
    
    fprintf(['Value of optimum with respect to mu (penaltyParameter):\n',... 
            'mu = ', stringWithPenaltyParameters, '\n',...
            'x1 = ', stringWithX1Optimum, '\n',...
            'x2 = ', stringWithX2Optimum, '\n'])