function modifiedPopulation = InsertBestIndividual(population,bestIndividual,...
    nCopiesBestIndividual)

    modifiedPopulation = population; 
    for i = 1:nCopiesBestIndividual
            modifiedPopulation(i).Chromosome = bestIndividual;
    end
end