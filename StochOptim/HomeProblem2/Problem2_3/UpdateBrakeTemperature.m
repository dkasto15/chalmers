function brakeTemperature = UpdateBrakeTemperature(brakeTemperature,...
    ambientTemperature, pedalPressure, temperatureConstantLowPressure,...
    temperatureConstantHighPressure, timeStep)

    relativeBrakeTemperature = brakeTemperature - ambientTemperature;
    
    if pedalPressure < 0.01
        temperatureDerivative = - relativeBrakeTemperature / temperatureConstantLowPressure;
    else
        temperatureDerivative = temperatureConstantHighPressure * pedalPressure;
    end
    temperatureChange = temperatureDerivative * timeStep;
    newRelativeBrakeTemperature = temperatureChange + relativeBrakeTemperature;
    
    brakeTemperature = ambientTemperature + newRelativeBrakeTemperature;
end