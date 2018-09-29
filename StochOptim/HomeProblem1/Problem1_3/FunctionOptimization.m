clear all;

populationSize = 100;
numberOfGenes = 50;
crossoverProbability = 0.8;
mutationProbability = 1 / numberOfGenes;
tournamentSelectionParameter = 0.75;
tournamentSize = 2;
variableRange = 10;
numberOfVariables = 2;
numberOfGenerations = 100;
nCopiesBestIndividual = 1; 

fitness = zeros(populationSize,1);
population = InitializePopulation(populationSize, numberOfGenes);

for iGeneration = 1:numberOfGenerations
    % Initialize maximumFitness with the smallest possible number to avoid 
    % the need for the "fitness values >= 0" assumption
    maximumFitness = -realmax;
	xBest = zeros(1,2);
	bestIndividualIndex = 0;
    for i = 1:populationSize
        chromosome = population(i,:);
        x = DecodeChromosome(chromosome, numberOfVariables, variableRange);
        fitness(i) = EvaluateIndividual(x);
        if (fitness(i) > maximumFitness)
            maximumFitness = fitness(i);
            bestIndividual = chromosome;
            xBest = x;
        end
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

disp('Location of function minimum');
disp(xBest);
disp('Minimum function value');
disp(1 / maximumFitness);