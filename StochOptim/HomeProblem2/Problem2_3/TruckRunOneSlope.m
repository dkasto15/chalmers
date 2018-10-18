function fitnessSlope = TruckRunOneSlope(Truck, iSlope, iDataSet, timeStep,...
            CONSTANT_OF_GRAVITY, allWeights, numberOfHiddenNeurons,...
            numberOfOutputs, sigmoidConstant, createTestPlot, slopeCounter)
    
    tmpStartIndex = 1;
    tmpEndIndex = numberOfHiddenNeurons;
    weightsHiddenLayer = allWeights(tmpStartIndex:tmpEndIndex);
    tmpStartIndex = tmpEndIndex + 1;
    tmpEndIndex = 2 * numberOfHiddenNeurons;
    biasesHiddenLayer = allWeights(tmpStartIndex:tmpEndIndex);
    tmpStartIndex = tmpEndIndex + 1;
    tmpEndIndex = tmpEndIndex + numberOfOutputs;
    weightsOutput = allWeights(tmpStartIndex:tmpEndIndex);
    tmpStartIndex = tmpEndIndex + 1;
    tmpEndIndex = tmpEndIndex + numberOfOutputs;
    biasesOutput = allWeights(tmpStartIndex:tmpEndIndex);
    
    position = 0; % [m]
    velocity = 20; % [m/s]
    gear = 7; % [m]
    brakeTemperature = 500; % [K]
    pedalPressure = 0;
    
    position = -getPosition(position, velocity, timeStep);
    currentTime = -timeStep; % [s]
    timeLastGearSwitch = -inf; % [s]
    earlyBreakCondition = false; 

    if strcmp(createTestPlot, 'yes')
        maxTimeStepsNotRounded = Truck.endDistance / (Truck.velocityMin * timeStep);
        maxTimeSteps = ceil(maxTimeStepsNotRounded);
        positionVector = zeros(maxTimeSteps,1);
        alphaVector = zeros(maxTimeSteps,1);
        pedalPressureVector = zeros(maxTimeSteps,1);
        gearVector = zeros(maxTimeSteps,1);
        velocityVector = zeros(maxTimeSteps,1);
        brakeTemperatureVector = zeros(maxTimeSteps,1);
        
        iTime = 1;
    end
        
    while (position < Truck.endDistance) && (~earlyBreakCondition)
        currentTime = currentTime + timeStep;  
        position = getPosition(position, velocity, timeStep);
        alpha = GetSlopeAngle(position, iSlope, iDataSet);
        acceleration = GetAcceleration(Truck.mass, alpha, CONSTANT_OF_GRAVITY,...
            Truck.foundationBrakeForcePrefactor, pedalPressure, brakeTemperature,...
            Truck.temperatureMax, Truck.gearFactors, gear);
        
        if strcmp(createTestPlot, 'yes')
            positionVector(iTime) = position;
            alphaVector(iTime) = alpha;
            pedalPressureVector(iTime) = pedalPressure;
            gearVector(iTime) = gear;
            velocityVector(iTime) = velocity;
            brakeTemperatureVector(iTime) = brakeTemperature;
            iTime = iTime + 1;
        end

        velocity = UpdateVelocity(velocity, acceleration, timeStep);
        brakeTemperature = UpdateBrakeTemperature(brakeTemperature,...
            Truck.ambientTemperature, pedalPressure, Truck.temperatureConstantLowPressure,...
            Truck.temperatureConstantHighPressure, timeStep);

        velocityInputNetwork = velocity / Truck.velocityMax;
        angleInputNetwork = alpha / Truck.angleMax; 
        temperatureInputNetwork = brakeTemperature / Truck.temperatureMax;
        [pedalPressure, desiredGearSwitch] = NeuralNetwork(velocityInputNetwork,...
            angleInputNetwork, temperatureInputNetwork, weightsHiddenLayer,...
            biasesHiddenLayer, weightsOutput, biasesOutput, sigmoidConstant);

        gearSwitchTimeCondition = (currentTime - timeLastGearSwitch) >= 2;
        gearMinCondition = (gear + desiredGearSwitch) >= Truck.gearMin;
        gearMaxCondition = (gear + desiredGearSwitch) <= Truck.gearMax;
        gearSwitchLimitsCondition = gearMinCondition && gearMaxCondition;
        if gearSwitchTimeCondition && gearSwitchLimitsCondition
            gear = gear + desiredGearSwitch;
            timeLastGearSwitch = currentTime;
        end

        velocityConstraint1 = velocity > Truck.velocityMin;
        velocityConstraint2 = velocity < Truck.velocityMax;
        velocityConstraints = velocityConstraint1 && velocityConstraint2;
        earlyBreak1 = brakeTemperature > Truck.temperatureMax;
        earlyBreak2 = ~velocityConstraints;
        earlyBreakCondition = earlyBreak1 || earlyBreak2; 
    end
    fitnessSlope = EvaluateIndividual(position, currentTime);
    
    if strcmp(createTestPlot, 'yes')
        usedIndices = alphaVector > 0;
        positionVector = positionVector(usedIndices);
        alphaVector = alphaVector(usedIndices);
        pedalPressureVector = pedalPressureVector(usedIndices);
        gearVector = gearVector(usedIndices);
        velocityVector = velocityVector(usedIndices);
        brakeTemperatureVector = brakeTemperatureVector(usedIndices);
        
        figure(slopeCounter)
        subplot(2,3,1)
        plot(positionVector, alphaVector)
        xlabel('Position [m]');
        ylabel('Angle');
        subplot(2,3,2)
        plot(positionVector, pedalPressureVector)
        xlabel('Position [m]');
        ylabel('Pedal pressure');
        subplot(2,3,3)
        plot(positionVector, gearVector)
        xlabel('Position [m]');
        ylabel('Gear');
        subplot(2,3,4)
        plot(positionVector, velocityVector)
        xlabel('Position [m]');
        ylabel('Velocity');
        subplot(2,3,5)
        plot(positionVector, brakeTemperatureVector)
        xlabel('Position [m]');
        ylabel('Brake temperature');
    end
end