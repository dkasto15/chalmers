numberOfRuns = 150;
decimalTolerance = 8;

PSO22
foundMinima = bestPositionSwarm;
functionMin = bestFunctionValueSwarm;
for i = 2:numberOfRuns
    PSO22
    roundedSwarmPosition = round(bestPositionSwarm, decimalTolerance);
    roundedMinimaPositions = round(foundMinima, decimalTolerance);
    if ~ismember(roundedSwarmPosition, roundedMinimaPositions,'rows')
        foundMinima = [foundMinima; bestPositionSwarm];
        functionMin = [functionMin; bestFunctionValueSwarm];
    end
end
disp('Found minima')
disp(foundMinima)
disp('Function values in minima')
disp(functionMin)