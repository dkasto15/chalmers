function mutatedChromosome = Mutate(chromosome,mutationProbability,...
            variableRegisterIndexRange, operandRegisterIndexRange,...
            operatorRegisterIndexRange)

    numberOfInstructions = length(chromosome)/4; 
    mutatedChromosome = chromosome;

    for iInstruction = 1:numberOfInstructions
        for iLocalGene = 1:4
            totalGeneIndex = (iInstruction - 1)*4 + iLocalGene;
            r = rand;
            if (r < mutationProbability)
                switch iLocalGene
                    case 1
                        mutatedChromosome(totalGeneIndex) = randi(operatorRegisterIndexRange);
                    case 2
                        mutatedChromosome(totalGeneIndex) = randi(variableRegisterIndexRange);
                    case 3 || 4
                        mutatedChromosome(totalGeneIndex) = randi(operandRegisterIndexRange);
                end
            end
        end
    end
end
