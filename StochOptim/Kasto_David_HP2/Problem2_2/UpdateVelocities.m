function velocities = UpdateVelocities(positions, velocities, cognitiveComponent,...
    socialComponent, bestPositionParticle, bestPositionSwarm, timeStep,...
    velocityMax, inertiaWeight)
    
    numberOfParticles = size(bestPositionParticle,1);
    numberOfVariables = size(bestPositionParticle,2);
    
    randomMatrix1 = rand(numberOfParticles, numberOfVariables);
    randomMatrix2 = rand(numberOfParticles, numberOfVariables);
    v1 = (bestPositionParticle - positions) ./ timeStep;
    bestSwarmRepeated = repmat(bestPositionSwarm, numberOfParticles, 1);
    v2 = (bestSwarmRepeated - positions) ./ timeStep;
    term1 = cognitiveComponent * randomMatrix1 .* v1;
    term2 = socialComponent * randomMatrix2 .* v2; 
    
    velocities = inertiaWeight * velocities + term1 + term2;
    velocities(velocities > velocityMax) = velocityMax;
    velocities(velocities < -velocityMax) = -velocityMax;
end