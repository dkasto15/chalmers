function PrintFunction(chromosome, operandRegister)

    nbrOfInstructions = length(chromosome)/4;

    symbolicOperandRegister = cell(size(operandRegister));
    syms x
    symbolicOperandRegister{1} = x;

    lengthOperandRegister = length(operandRegister);
    for i = 2:lengthOperandRegister
       symbolicOperandRegister{i} = operandRegister(i);
    end

    for iInstruction = 1:nbrOfInstructions
        startIndex = 4*(iInstruction - 1) + 1;
        operator = chromosome(startIndex);
        destinationRegister = chromosome(startIndex + 1);
        operand1 = symbolicOperandRegister{chromosome(startIndex + 2)};
        operand2 = symbolicOperandRegister{chromosome(startIndex + 3)};

        switch operator
            case 1
                symbolicOperandRegister{destinationRegister} = operand1 + operand2;
            case 2
                symbolicOperandRegister{destinationRegister} = operand1 - operand2;
            case 3
                symbolicOperandRegister{destinationRegister} = operand1 * operand2;
            case 4
                symbolicOperandRegister{destinationRegister} = operand1 / operand2;
        end
    end
    yHat = symbolicOperandRegister{1};
    if ~isa(yHat, 'double')
        yHat = collect(yHat);
    end
    disp(yHat)
end