function nextNode = GetNode(currentNode, tabuList, pheromoneLevel, visibility, alpha, beta)
    numberOfCities = length(visibility);
    
    eligibleCities = 1:numberOfCities;
    eligibleCities(tabuList) = [];
    eligiblePheromone = pheromoneLevel(:,currentNode);
    eligiblePheromone(tabuList) = [];
    eligibleVisibility = visibility(:,currentNode);
    eligibleVisibility(tabuList) = [];
    
    numerator = (eligiblePheromone.^alpha) .* (eligibleVisibility.^beta);
    probabilities = numerator / sum(numerator);
    
    counter = 1;
    r = rand;
    cumulativeProbability = probabilities(1);
    while cumulativeProbability < r
        counter = counter + 1;
        cumulativeProbability = sum(probabilities(1:counter));
    end
    
    nextNode = eligibleCities(counter);
end