clear all;

trainingSlopes = 1:10;
validationSlopes = 1:5; 
testSlopes = 1:5; 
iDataSetTraining = 1;
iDataSetValidation = 2;
iDataSetTest = 3;
maxConsecutiveValidationDecreases = inf;
numberOfHiddenNeurons = 7;
numberOfOutputs = 2;
numberOfVariables = 2 * (numberOfHiddenNeurons + numberOfOutputs);
numberOfGenes = numberOfVariables * 20;
sigmoidConstant = 1;
createTestPlot = '';

populationSize = 100;
crossoverProbability = 0.8;
mutationProbability = 1 / numberOfGenes;
tournamentSelectionParameter = 0.75;
tournamentSize = 3;
variableRange = 12;
numberOfGenerations = 50000;
plotEveryXthGeneration = 1;
numberOfPlotDataPoints = numberOfGenerations / plotEveryXthGeneration;
nCopiesBestIndividual = 1; 

population = InitializePopulation(populationSize, numberOfGenes);

fitness = zeros(populationSize,1);
maximumFitnessValidationAllGenerations = 0;
consecutiveValidationDecreases = 0;

maximumFitnessVector = zeros(numberOfPlotDataPoints,1);
maximumFitnessValidationVector = zeros(numberOfPlotDataPoints,1);

for iGeneration = 1:numberOfGenerations
    maximumFitness = -realmax;
    maximumFitnessValidation = -realmax;
    for i = 1:populationSize
        chromosome = population(i,:);
        x = DecodeChromosome(chromosome, numberOfVariables, variableRange);
        fitness(i) = TruckModel(x, numberOfHiddenNeurons, numberOfOutputs,...
            sigmoidConstant, iDataSetTraining, trainingSlopes, createTestPlot);
        if (fitness(i) > maximumFitness)
            maximumFitness = fitness(i);
            bestIndividual = chromosome;
            xBest = x;
        end
        fitnessValidation = TruckModel(x, numberOfHiddenNeurons, numberOfOutputs,...
        sigmoidConstant, iDataSetValidation, validationSlopes, createTestPlot);
        if (fitnessValidation > maximumFitnessValidation)
            maximumFitnessValidation = fitnessValidation;
            bestIndividualValidation = chromosome;
            xBestValidation = x;
        end
    end
    
    if mod(iGeneration, plotEveryXthGeneration) == 0
        plotIndex = iGeneration / plotEveryXthGeneration;
        maximumFitnessVector(plotIndex) = maximumFitness;
        maximumFitnessValidationVector(plotIndex) = maximumFitnessValidation;
    end
    
    if maximumFitnessValidation < maximumFitnessValidationAllGenerations
        consecutiveValidationDecreases = consecutiveValidationDecreases + 1;
    elseif maximumFitnessValidation > maximumFitnessValidationAllGenerations
        maximumFitnessValidationAllGenerations = maximumFitnessValidation;
        consecutiveValidationDecreases = 0;
        tmpBestIndividual = bestIndividualValidation;
        tmpBestX = xBestValidation;
        disp('Generation');
        disp(iGeneration);
        disp('Maximum fitness');
        disp(maximumFitnessValidationAllGenerations);
        csvwrite('BestWeights', tmpBestX);
        csvwrite('BestFitness', maximumFitnessValidationAllGenerations);
    end
    if consecutiveValidationDecreases > maxConsecutiveValidationDecreases
        bestIndividual = tmpBestIndividual; 
        xBest = tmpBestX; 
        maximumFitness = maximumFitnessValidationAllGenerations;
        break;
    end
    
    tempPopulation = population;

    for i = 1:2:populationSize
        i1 = TournamentSelect(fitness, tournamentSelectionParameter, tournamentSize);
        i2 = TournamentSelect(fitness, tournamentSelectionParameter, tournamentSize);
        chromosome1 = population(i1,:);
        chromosome2 = population(i2,:);

        r = rand;
        if (r < crossoverProbability)
            newChromosomePair = Cross(chromosome1, chromosome2);
            tempPopulation(i,:) = newChromosomePair(1,:);
            tempPopulation(i+1,:) = newChromosomePair(2,:);
        else
            tempPopulation(i,:) = chromosome1;
            tempPopulation(i+1,:) = chromosome2;
        end
    end

    for i = 1:populationSize
        originalChromosome = tempPopulation(i,:);
        mutatedChromosome = Mutate(originalChromosome,mutationProbability); 
        tempPopulation(i,:) = mutatedChromosome;
    end
    
    tempPopulation = InsertBestIndividual(tempPopulation,...
        bestIndividual,nCopiesBestIndividual);
    population = tempPopulation;
end

disp('Location of fitness maximum');
disp(tmpBestX);
disp('Maximum fitness value');
disp(maximumFitnessValidationAllGenerations);

generationVector = linspace(plotEveryXthGeneration,iGeneration,numberOfPlotDataPoints)';
subplot(1,2,1)
plot(generationVector, maximumFitnessVector, '.')
xlabel('Number of generations');
ylabel('Maximum fitness');
title('Training set')
subplot(1,2,2)
plot(generationVector, maximumFitnessValidationVector, '.')
xlabel('Number of generations');
ylabel('Maximum fitness');
title('Validation set')

csvwrite('BestWeights', tmpBestX);
csvwrite('BestFitness', maximumFitnessValidationAllGenerations);