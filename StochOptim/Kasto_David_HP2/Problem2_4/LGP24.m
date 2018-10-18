clear all;

populationSize = 100;
nbrOfInstructionsInitialRange = [3, 22];
maxChromosomeLength = 180; 
initialCrossoverProbability = 0.4;
crossoverChangeFactor = 0.99;
finalCrossoverProbability = 0.2;
initialMutationProbability = 0.4;
mutationChangeFactor = 0.99;
finalMutationProbability = 1 / maxChromosomeLength;
tournamentSelectionParameter = 0.75;
tournamentSize = 5;
nbrOfCopiesBestIndividual = 1; 

variableRegister = [0, 0, 0];
constantRegister = [1, 3, -1];
operandRegister = [variableRegister, constantRegister];
nbrOfVariables = length(variableRegister);
nbrOfConstants = length(constantRegister);
nbrOfOperands = nbrOfVariables + nbrOfConstants;
variableRegisterIndexRange = [1, nbrOfVariables];
operandRegisterIndexRange = [1, nbrOfOperands];
operatorRegisterIndexRange = [1, 4];
divisionByZeroConstant = realmax;

maxFitnessAllGenerations = -realmax;
fitness = zeros(populationSize,1);
population = InitializePopulation(populationSize, nbrOfInstructionsInitialRange,...
    variableRegisterIndexRange, operandRegisterIndexRange, operatorRegisterIndexRange);

lastGenerationWithIncrease = 0;
rootMeanSquareError = realmax;
crossoverProbability = initialCrossoverProbability;
mutationProbability = initialMutationProbability;
iGeneration = 0;
while rootMeanSquareError > 0.01   
    iGeneration = iGeneration + 1;
    
    if (mod(iGeneration,5) == 0) && (mutationProbability > finalMutationProbability)
        mutationProbability = mutationProbability * mutationChangeFactor;
    end
    
    if (mod(iGeneration,20) == 0) && (crossoverProbability > finalCrossoverProbability)
        crossoverProbability = crossoverProbability * crossoverChangeFactor;
    end
    
    if mod(iGeneration - lastGenerationWithIncrease, 1000) == 0
        mutationProbability = mutationProbability * 5;
    end
    
    maximumFitness = -realmax;
    for i = 1:populationSize
        chromosome = population(i).Chromosome;
        fitness(i) = EvaluateIndividual(chromosome, operandRegister,...
            maxChromosomeLength, divisionByZeroConstant);
        if (fitness(i) > maximumFitness)
            maximumFitness = fitness(i);
            bestIndividual = chromosome;
        end
    end
    
    tempPopulation = population;

    for i = 1:2:populationSize
        i1 = TournamentSelect(fitness, tournamentSelectionParameter, tournamentSize);
        i2 = TournamentSelect(fitness, tournamentSelectionParameter, tournamentSize);
        chromosome1 = population(i1).Chromosome;
        chromosome2 = population(i2).Chromosome;
        
        r = rand;
        if (r < crossoverProbability)
            [newChromosome1, newChromosome2] = Cross(chromosome1, chromosome2);
            tempPopulation(i).Chromosome = newChromosome1;
            tempPopulation(i+1).Chromosome = newChromosome2;
        else
            tempPopulation(i).Chromosome = chromosome1;
            tempPopulation(i+1).Chromosome = chromosome2;
        end
    end

    for i = 1:populationSize
        originalChromosome = tempPopulation(i).Chromosome;
        mutatedChromosome = Mutate(originalChromosome,mutationProbability,...
            variableRegisterIndexRange, operandRegisterIndexRange,...
            operatorRegisterIndexRange);
        tempPopulation(i).Chromosome = mutatedChromosome;
    end
    
    tempPopulation = InsertBestIndividual(tempPopulation,...
        bestIndividual,nbrOfCopiesBestIndividual);
    population = tempPopulation;
    if maximumFitness > maxFitnessAllGenerations
        lastGenerationWithIncrease = iGeneration;
        maxFitnessAllGenerations = maximumFitness;
        bestIndividualAllGenerations = bestIndividual;
        rootMeanSquareError = 1 / maxFitnessAllGenerations;
        disp('Root mean square error');
        disp(rootMeanSquareError);
        close all
        PlotCurve(bestIndividualAllGenerations, operandRegister,...
            divisionByZeroConstant, rootMeanSquareError);
        PrintFunction(bestIndividualAllGenerations, operandRegister)
        fprintf('Generation %d: Chromosome length %d and mean square error %6f\n', iGeneration, length(bestIndividualAllGenerations)/4, rootMeanSquareError)
        pause(0.1)
    end
end

disp('Root mean square error');
disp(1 / maximumFitness);