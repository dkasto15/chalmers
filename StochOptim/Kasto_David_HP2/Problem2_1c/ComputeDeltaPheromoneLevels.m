function deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,...
    pathLengthCollection)
    numberOfAnts = length(pathLengthCollection);
    lengthPathCollection = length(pathCollection);
    lengthPath = lengthPathCollection / numberOfAnts;
    
    deltaPheromoneLevel = zeros(lengthPath-1);
    for i=1:lengthPathCollection-1
        antIndex = ceil(i/lengthPath);
        nodeIndex1 = pathCollection(i);
        nodeIndex2 = pathCollection(i+1);
        invertedDistance = 1 / pathLengthCollection(antIndex);
        levelIncrement = deltaPheromoneLevel(nodeIndex2,nodeIndex1) + invertedDistance;
        deltaPheromoneLevel(nodeIndex2,nodeIndex1) = levelIncrement;
    end
end