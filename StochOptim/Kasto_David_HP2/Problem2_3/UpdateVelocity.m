function velocity = UpdateVelocity(velocity, acceleration, timeStep)
	velocity = acceleration * timeStep + velocity;
end