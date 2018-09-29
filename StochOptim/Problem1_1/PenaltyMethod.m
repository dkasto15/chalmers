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
    
    outputTableData = round([penaltyParameterVector', xOptimum(1,:)',...
        xOptimum(2,:)'], 3);
    variableNames = {'mu', 'x1', 'x2'};
    fprintf('Value of optimum with respect to mu (penaltyParameter):\n');
    outputTable = table(outputTableData(:,1), outputTableData(:,2),...
        outputTableData(:,3), 'VariableNames', variableNames);
end