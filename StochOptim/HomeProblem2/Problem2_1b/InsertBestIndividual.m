function modifiedPopulation = InsertBestIndividual(population,bestIndividual,...
    nCopiesBestIndividual)

    modifiedPopulation = population; 
    for j = 1:nCopiesBestIndividual
            modifiedPopulation(j,:) = bestIndividual;
    end
end