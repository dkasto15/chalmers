function positions = UpdatePositions(positions, velocities, timeStep)
    
    positions = positions + velocities * timeStep; 
end