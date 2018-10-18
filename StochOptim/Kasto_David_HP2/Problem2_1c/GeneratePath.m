function path = GeneratePath(pheromoneLevel, visibility, alpha, beta)
    numberOfCities = length(visibility);
    path = zeros(numberOfCities+1,1);
    
    startingIndex = randi(numberOfCities);
    path(1) = startingIndex;
    tabuList = startingIndex;
    lengthPath = length(path);
    currentNode = startingIndex;
    for i = 2:lengthPath-1
        nextNode = GetNode(currentNode, tabuList, pheromoneLevel, visibility,...
            alpha, beta);
        path(i) = nextNode;
        currentNode = nextNode;
        tabuList = [tabuList, currentNode];
    end
    path(end) = startingIndex;
    
end