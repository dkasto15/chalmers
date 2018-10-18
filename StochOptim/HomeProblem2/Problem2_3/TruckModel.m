function fitness = TruckModel(allWeights, numberOfHiddenNeurons,...
    numberOfOutputs, sigmoidConstant, iDataSet, iSlopes, createTestPlot)

    CONSTANT_OF_GRAVITY = 9.816; % [m/s^2], approximate value in Sweden
    timeStep = 0.3; % [s]
    Truck.ambientTemperature = 283; % [K]
    Truck.mass = 20000; % [kg] 
    Truck.temperatureMax = 750; % [K]
    Truck.velocityMax = 25; % [m/s]
    Truck.velocityMin = 1; % [m/s]
    Truck.endDistance = 1000; % [m]
    Truck.angleMax = 10; % [degrees]
    Truck.temperatureConstantLowPressure = 30; % [s]
    Truck.temperatureConstantHighPressure = 40; % [K/s]
    Truck.engineBrakeConstant = 3000; % [N]
    Truck.gearMax = 10;
    Truck.gearMin = 1;

    Truck.foundationBrakeForcePrefactor = (Truck.mass * CONSTANT_OF_GRAVITY) / 20;
    gearPreFactors = [7.0, 5.0, 4.0, 3.0, 2.5, 2.0, 1.6, 1.4, 1.2, 1];
    Truck.gearFactors = gearPreFactors * Truck.engineBrakeConstant;

    numberOfSlopes = length(iSlopes);
    fitnessSlope = zeros(numberOfSlopes,1);
    slopeCounter = 1;
    for iSlope = iSlopes
        fitnessSlope(slopeCounter) = TruckRunOneSlope(Truck, iSlope, iDataSet,...
            timeStep, CONSTANT_OF_GRAVITY, allWeights, numberOfHiddenNeurons,...
            numberOfOutputs, sigmoidConstant, createTestPlot, slopeCounter);
        slopeCounter = slopeCounter + 1;
    end
    fitness = min(fitnessSlope) + mean(fitnessSlope);
end