function population = InitializePopulation(populationSize, nbrOfInstructionsInitialRange,...
    variableRegisterIndexRange, operandRegisterIndexRange, operatorRegisterIndexRange)

    population = [];
    for iIndividual = 1:populationSize
        nbrOfInstructions = randi(nbrOfInstructionsInitialRange);
        chromosomeLength = 4 * nbrOfInstructions;
        tmpChromosome = zeros(chromosomeLength,1);
        for jInstruction = 1:nbrOfInstructions
            firstIndex = 4*(jInstruction-1) + 1;
            tmpChromosome(firstIndex) = randi(operatorRegisterIndexRange);
            tmpChromosome(firstIndex + 1) = randi(variableRegisterIndexRange);
            tmpChromosome(firstIndex + 2) = randi(operandRegisterIndexRange);
            tmpChromosome(firstIndex + 3) = randi(operandRegisterIndexRange);
        end
        tmpIndividual = struct('Chromosome',tmpChromosome);
        population = [population, tmpIndividual];
    end
    
end