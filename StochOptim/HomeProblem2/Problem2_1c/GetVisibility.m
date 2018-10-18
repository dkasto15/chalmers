function visibility = GetVisibility(cityLocation)
    numberOfCities = length(cityLocation);
    cityDistance = zeros(numberOfCities);
    for cityIndex1 = 1:numberOfCities
        cityLocationX = cityLocation(cityIndex1,1);
        cityLocationY = cityLocation(cityIndex1,2);

        for cityIndex2 = cityIndex1:numberOfCities
                secondCityLocationX = cityLocation(cityIndex2,1);
                secondCityLocationY = cityLocation(cityIndex2,2);
                xDistanceSquared = (secondCityLocationX - cityLocationX)^2;
                yDistanceSquared = (secondCityLocationY - cityLocationY)^2;
                pathLength = sqrt(xDistanceSquared + yDistanceSquared);
                cityDistance(cityIndex1,cityIndex2) = pathLength;
                cityDistance(cityIndex2,cityIndex1) = pathLength;
        end
    end
    % Avoid division by zero, diagonal elements won't be used
    cityDistance(logical(eye(numberOfCities))) = 1;
    
    visibility = 1 ./ cityDistance; 
end