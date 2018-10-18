function fitnessIndividual = EvaluateIndividual(distance, currentTime)
	averageVelocity = distance / currentTime;
    fitnessIndividual = averageVelocity * distance;
end
