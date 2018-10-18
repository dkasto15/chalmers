function fitnessValue = EvaluateIndividual(chromosome, cityLocation)
    
    fullPath = [chromosome, chromosome(1)];
    pathLength = 0; 
    lengthOfChromosome = length(fullPath); 
    for i = 1:lengthOfChromosome-1
        cityIndex = fullPath(i);
        nextCityIndex = fullPath(i+1);
        
        cityLocationX = cityLocation(cityIndex,1);
        nextCityLocationX = cityLocation(nextCityIndex,1);
        cityLocationY = cityLocation(cityIndex,2);
        nextCityLocationY = cityLocation(nextCityIndex,2);
        
        xDistanceSquared = (nextCityLocationX - cityLocationX)^2;
        yDistanceSquared = (nextCityLocationY - cityLocationY)^2;
        pathLength = pathLength + sqrt(xDistanceSquared + yDistanceSquared);
    end

    fitnessValue = 1 / pathLength; 
end