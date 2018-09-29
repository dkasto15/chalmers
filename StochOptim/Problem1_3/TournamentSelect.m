function iSelected = TournamentSelect(fitness, pTournament, tournamentSize)
    
    populationSize = size(fitness,1);
    randomIndices = 1 + fix(rand(tournamentSize, 1)*populationSize);
    fitnessValues = fitness(randomIndices);
    for i = 2:tournamentSize
        r = rand;
        [~, maxIndex] = max(fitnessValues);
        if (r < pTournament)
            iSelected = randomIndices(maxIndex);
            break
        elseif i == tournamentSize 
            % Pick the only remaining index apart from maxIndex
            iSelected = randomIndices(3 - maxIndex);
        else % Remove current max from tournament
            randomIndices(maxIndex) = [];
            fitnessValues(maxIndex) = [];
        end
    end

end