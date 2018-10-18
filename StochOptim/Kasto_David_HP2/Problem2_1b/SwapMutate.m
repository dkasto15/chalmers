function mutatedChromosome = SwapMutate(chromosome,mutationProbability)

    nGenes = size(chromosome, 2); 
    mutatedChromosome = chromosome;
    if ~isequal(sort(mutatedChromosome), 1:50)
        disp('he')
    end
    for j = 1:nGenes
        r = rand;
        if (r < mutationProbability)
            cityNumber = mutatedChromosome(j);
            otherGenes = mutatedChromosome([1:j-1, j+1:end]);
            randomOtherIndex = randi(nGenes-1);
            mutatedChromosome(j) = otherGenes(randomOtherIndex);
            convertedOtherIndex = randomOtherIndex + double(randomOtherIndex>=j);
            mutatedChromosome(convertedOtherIndex) = cityNumber;
            if ~isequal(sort(mutatedChromosome), sort(chromosome))
                disp('hej')
            end
        end
    end
end