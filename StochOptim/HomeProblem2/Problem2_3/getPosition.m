function position = getPosition(position, velocity, timeStep)
	position = position + velocity * timeStep;
end