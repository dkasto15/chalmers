function outputTable = PenaltyMethod()
    penaltyParameterVector = [1, 10, 100, 1000];
    stepLength = 0.0001;
    threshold = 1e-6;
    x0 = [1; 2];
    
    lengthPenaltyParameter = length(penaltyParameterVector);
    xOptimum = zeros(2, lengthPenaltyParameter);
    for i = 1:lengthPenaltyParameter
        penaltyParameter = penaltyParameterVector(i);
        xOptimum(:, i) = GradientDescent(x0, penaltyParameter, stepLength,...
            threshold);
    end
    
    % Ensure that three decimals are displayed in output
    x1OptimumString = strings(lengthPenaltyParameter, 1);
    x2OptimumString = strings(lengthPenaltyParameter, 1);
    for i = 1:lengthPenaltyParameter
        x1ElementString = sprintf('%.3f', xOptimum(1,i));
        x2ElementString = sprintf('%.3f', xOptimum(2,i));
        x1OptimumString(i) = x1ElementString;
        x2OptimumString(i) = x2ElementString;
    end
    
    variableNamesTable = {'mu', 'x1', 'x2'};
    outputTable = table(penaltyParameterVector', x1OptimumString,...
        x2OptimumString, 'VariableNames', variableNamesTable);
end