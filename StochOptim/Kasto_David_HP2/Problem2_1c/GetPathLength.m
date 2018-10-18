function pathLength = GetPathLength(path,cityLocation)
    lenghtOfPath = length(path);
    pathLength = 0;
    
    for i = 1:lenghtOfPath - 1
        cityIndex = path(i);
        nextCityIndex = path(i + 1);
        
        cityLocationX = cityLocation(cityIndex,1);
        cityLocationY = cityLocation(cityIndex,2);
        secondCityLocationX = cityLocation(nextCityIndex,1);
        secondCityLocationY = cityLocation(nextCityIndex,2);
        xDistanceSquared = (secondCityLocationX - cityLocationX)^2;
        yDistanceSquared = (secondCityLocationY - cityLocationY)^2;
        pathLength = pathLength + sqrt(xDistanceSquared + yDistanceSquared);
    end

end