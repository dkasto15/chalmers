numberOfParticles = 30;
numberOfVariables = 2;
numberOfIterations = 1000;
rangeMax = 5; 
rangeMin = -5;
alpha = 1; 
timeStep = 1;
cognitiveComponent = 2; 
socialComponent = 2;
inertiaWeight = 1.4;
inertiaWeightMin = 0.4;
beta = 0.99;
velocityMax = (rangeMax - rangeMin) / timeStep;

positions = InitializePositions(numberOfParticles, numberOfVariables,...
    rangeMin, rangeMax); 
velocities = InitializeVelocities(numberOfParticles, numberOfVariables,...
    alpha, timeStep, rangeMin, rangeMax); 

bestPositionParticle = positions;
bestFunctionValueParticle = ones(numberOfParticles, 1)*realmax;
bestPositionSwarm = bestPositionParticle(1,:);
bestFunctionValueSwarm = realmax;
for iIteration = 1:numberOfIterations
    
    for i = 1:numberOfParticles
        functionValue = EvaluateParticle(positions(i,:));
        if functionValue < bestFunctionValueParticle(i)
            bestPositionParticle(i,:) = positions(i,:);
            bestFunctionValueParticle(i) = functionValue;
        end
        if functionValue < bestFunctionValueSwarm
            bestPositionSwarm = positions(i,:);
            bestFunctionValueSwarm = functionValue;
        end       
    end

    velocities = UpdateVelocities(positions, velocities, cognitiveComponent,...
        socialComponent, bestPositionParticle, bestPositionSwarm, timeStep,...
        velocityMax, inertiaWeight);
    positions = UpdatePositions(positions, velocities, timeStep);
    if inertiaWeight > inertiaWeightMin
        inertiaWeight = inertiaWeight * beta;
    end
    
end
