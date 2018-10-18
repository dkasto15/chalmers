clear all;
close all;

cityLocation = LoadCityLocations;
populationSize = 50;
nCities = size(cityLocation,1);
mutationProbability = 1 / nCities;
tournamentSelectionParameter = 0.75;
tournamentSize = 3;
numberOfGenerations = 100000;
nCopiesBestIndividual = 1;    

fitness = zeros(populationSize,1);
population = InitializePopulation(populationSize, nCities);

tspFigure = InitializeTspPlot(cityLocation,[0 20 0 20]); 
connection = InitializeConnections(cityLocation); 

for iGeneration = 1:numberOfGenerations
    maximumFitness = -realmax;
    for i = 1:populationSize
        chromosome = population(i,:);
        fitness(i) = EvaluateIndividual(chromosome, cityLocation);
        if (fitness(i) > maximumFitness)
            maximumFitness = fitness(i);
            bestIndividual = chromosome;
            PlotPath(connection,cityLocation,bestIndividual);
        end
    end
    
    tempPopulation = population;

    for i = 1:2:populationSize
        i1 = TournamentSelect(fitness, tournamentSelectionParameter, tournamentSize);
        i2 = TournamentSelect(fitness, tournamentSelectionParameter, tournamentSize);
        tempPopulation(i,:) = population(i1,:);
        tempPopulation(i+1,:) = population(i2,:);
    end

    for i = 1:populationSize
        originalChromosome = tempPopulation(i,:);
        mutatedChromosome = SwapMutate(originalChromosome,mutationProbability); 
        tempPopulation(i,:) = mutatedChromosome;
    end
    
    tempPopulation = InsertBestIndividual(tempPopulation,...
        bestIndividual,nCopiesBestIndividual);
    population = tempPopulation;
end