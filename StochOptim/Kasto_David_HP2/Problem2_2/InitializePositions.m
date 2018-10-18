function positions = InitializePositions(numberOfParticles, numberOfVariables,...
    rangeMin, rangeMax)

    randomMatrix = rand(numberOfParticles, numberOfVariables);
    positions = rangeMin + randomMatrix*(rangeMax - rangeMin);
end