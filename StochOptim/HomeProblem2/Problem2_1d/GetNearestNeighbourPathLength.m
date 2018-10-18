function nearestNeighbourPathLength = GetNearestNeighbourPathLength(cityLocation)
    numberOfCities = length(cityLocation);
    startingIndex = randi(numberOfCities);
    citiesToBeVisited = 1:numberOfCities;
    
    nearestNeighbourPathLength = 0;
    cityIndex = startingIndex;
    for i = 1:numberOfCities - 1
        cityLocationX = cityLocation(cityIndex,1);
        cityLocationY = cityLocation(cityIndex,2);
        citiesToBeVisited(citiesToBeVisited == cityIndex) = [];
        nearestNeigbourDistance = realmax;
        for j = citiesToBeVisited
            nextCityLocationX = cityLocation(j,1);
            nextCityLocationY = cityLocation(j,2);
            xDistanceSquared = (nextCityLocationX - cityLocationX)^2;
            yDistanceSquared = (nextCityLocationY - cityLocationY)^2;
            pathLength = sqrt(xDistanceSquared + yDistanceSquared);
            if pathLength < nearestNeigbourDistance
                nearestNeigbourDistance = pathLength;
                nearestNeigbourIndex = j;
            end
        end
        nearestNeighbourPathLength = nearestNeighbourPathLength + nearestNeigbourDistance;
        cityIndex = nearestNeigbourIndex;
    end
    
    cityLocationX = cityLocation(cityIndex,1);
    cityLocationY = cityLocation(cityIndex,2);
    nextCityLocationX = cityLocation(startingIndex,1);
    nextCityLocationY = cityLocation(startingIndex,2);
    xDistanceSquared = (nextCityLocationX - cityLocationX)^2;
    yDistanceSquared = (nextCityLocationY - cityLocationY)^2;
    pathLength = sqrt(xDistanceSquared + yDistanceSquared);
    nearestNeighbourPathLength = nearestNeighbourPathLength + pathLength;
end

