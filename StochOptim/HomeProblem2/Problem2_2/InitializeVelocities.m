function velocities = InitializeVelocities(numberOfParticles, numberOfVariables,...
    alpha, timeStep, rangeMin, rangeMax)
    
    randomMatrix = rand(numberOfParticles, numberOfVariables);
    prefactor = alpha / timeStep;
    range = rangeMax - rangeMin;
    term1 = -range / 2;
    term2 = randomMatrix .* range;
    velocities = prefactor .* (term1 + term2);
end