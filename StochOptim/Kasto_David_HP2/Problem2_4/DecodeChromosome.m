function yHat = DecodeChromosome(chromosome, operandRegister, divisionByZeroConstant)
    
    nbrOfInstructions = length(chromosome)/4;

    for iInstruction = 1:nbrOfInstructions
        startIndex = 4*(iInstruction - 1) + 1;
        operator = chromosome(startIndex);
        destinationRegister = chromosome(startIndex + 1);
        operand1 = operandRegister(chromosome(startIndex + 2));
        operand2 = operandRegister(chromosome(startIndex + 3));
        
        switch operator
            case 1
                operandRegister(destinationRegister) = operand1 + operand2;
            case 2
                operandRegister(destinationRegister) = operand1 - operand2;
            case 3
                operandRegister(destinationRegister) = operand1 * operand2;
            case 4
                if operand2 ~= 0
                    operandRegister(destinationRegister) = operand1 / operand2;
                else
                    operandRegister(destinationRegister) = divisionByZeroConstant;
                end
        end
    end
    yHat = operandRegister(1);
end