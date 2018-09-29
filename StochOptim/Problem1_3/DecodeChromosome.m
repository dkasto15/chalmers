function x = DecodeChromosome(chromosome, numberOfVariables, variableRange)
    
    nGenes = length(chromosome);
    bitsPerVariable = nGenes / numberOfVariables;
    
    x = zeros(1, numberOfVariables);

    for i = 1:numberOfVariables
        for j = 1:bitsPerVariable
            index = bitsPerVariable*(i - 1) + j;
            x(i) = x(i) + chromosome(index)*2^(-j);
        end
        x(i) = -variableRange + 2*variableRange*x(i)/(1 - 2^(-bitsPerVariable));
    end
end