function output = GetNeuronOutput(inputs, weight, bias, sigmoidConstant, encoding)
    
    weightedSum = sum(weight*inputs) + bias;
    logisticSigmoid = 1 / (1 + exp(-sigmoidConstant * weightedSum));
    if strcmp(encoding, 'logisticSigmoid')
        output = logisticSigmoid;
    elseif strcmp(encoding, 'gearChange')
        if logisticSigmoid < 0.3
            output = -1;
        elseif logisticSigmoid < 0.7
            output = 0;
        else
            output = 1;
        end
    end
end