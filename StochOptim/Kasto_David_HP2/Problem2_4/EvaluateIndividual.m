function fitnessValue = EvaluateIndividual(chromosome, operandRegister,...
            maxChromosomeLength, divisionByZeroConstant)
    functionData = LoadFunctionData;
    x = functionData(:,1);
    y = functionData(:,2);
    
    numberOfDataPoints = length(x);
    yHat = zeros([numberOfDataPoints, 1]);
    for i = 1:numberOfDataPoints
        operandRegister(1) = x(i);
        yHat(i) = DecodeChromosome(chromosome, operandRegister, divisionByZeroConstant);
    end
    
    sumSquaredError = sum((yHat - y).^2);
    rootMeanSquaredError = sqrt((1 / numberOfDataPoints) * sumSquaredError);
    
    fitnessValue = 1 / rootMeanSquaredError;

    chromosomeLength = length(chromosome);
    if chromosomeLength > maxChromosomeLength
        errorFactor = (chromosomeLength - maxChromosomeLength) / maxChromosomeLength;
        penalty = 1 - errorFactor;
        fitnessValue = fitnessValue * penalty; 
    end
end