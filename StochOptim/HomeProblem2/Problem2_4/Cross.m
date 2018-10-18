function [newChromosome1, newChromosome2] = Cross(chromosome1,chromosome2)

    nbrOfInstructions1 = length(chromosome1)/4;
    nbrOfInstructions2 = length(chromosome2)/4;
    range1 = [0, nbrOfInstructions1];
    range2 = [0, nbrOfInstructions2];
    crossoverPointsChromosome1 = sort(randi(range1, 1, 2) * 4);
    crossoverPointsChromosome2 = sort(randi(range2, 1, 2) * 4);

    tmpEnd = crossoverPointsChromosome1(1);
    newChromosome1Part1 = chromosome1(1:tmpEnd);
    tmpStart = crossoverPointsChromosome2(1) + 1;
    tmpEnd = crossoverPointsChromosome2(2);
    newChromosome1Part2 = chromosome2(tmpStart:tmpEnd);
    tmpStart = crossoverPointsChromosome1(2) + 1;
    newChromosome1Part3 = chromosome1(tmpStart:end);
    
    tmpEnd = crossoverPointsChromosome2(1);
    newChromosome2Part1 = chromosome2(1:tmpEnd);
    tmpStart = crossoverPointsChromosome1(1) + 1;
    tmpEnd = crossoverPointsChromosome1(2);
    newChromosome2Part2 = chromosome1(tmpStart:tmpEnd);
    tmpStart = crossoverPointsChromosome2(2) + 1;
    newChromosome2Part3 = chromosome2(tmpStart:end);

    newChromosome1 = [newChromosome1Part1; newChromosome1Part2; newChromosome1Part3];
    newChromosome2 = [newChromosome2Part1; newChromosome2Part2; newChromosome2Part3];
end