function [pedalPressure, desiredGear] = NeuralNetwork(velocityInputNetwork,...
            angleInputNetwork, temperatureInputNetwork, weightsHiddenLayer,...
            biasesHiddenLayer, weightsOutput, biasesOutput, sigmoidConstant)
    
    inputs = [velocityInputNetwork, angleInputNetwork, temperatureInputNetwork];
    numberOfHiddenNeurons = length(weightsHiddenLayer);
    encodingHiddenLayer = 'logisticSigmoid';
    encodingPedalPressure = encodingHiddenLayer;
    encodingDesiredGear = 'gearChange';
    
    outputsHiddenLayer = zeros(numberOfHiddenNeurons,1); 
    for i = 1:numberOfHiddenNeurons
        outputsHiddenLayer(i) = GetNeuronOutput(inputs, weightsHiddenLayer(i),...
            biasesHiddenLayer(i), sigmoidConstant, encodingHiddenLayer);
    end
    
    pedalPressure = GetNeuronOutput(outputsHiddenLayer, weightsOutput(1),...
        biasesOutput(1), sigmoidConstant, encodingPedalPressure);
    desiredGear = GetNeuronOutput(outputsHiddenLayer,...
        weightsOutput(2), biasesOutput(2), sigmoidConstant, encodingDesiredGear);    
end