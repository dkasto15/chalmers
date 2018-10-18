function acceleration = GetAcceleration(truckMass, alpha,...
    CONSTANT_OF_GRAVITY, foundationBrakeForcePrefactor, pedalPressure,...
    brakeTemperature, temperatureMax, gearFactors, gear)
    
    forceGravity = truckMass * CONSTANT_OF_GRAVITY * sind(alpha);
    
    if brakeTemperature < temperatureMax - 100
        forceFoundationBrake = foundationBrakeForcePrefactor * pedalPressure;
    else
        f1 = foundationBrakeForcePrefactor * pedalPressure;
        exponent = -(brakeTemperature - (temperatureMax - 100)) / 100;
        f2 = exp(exponent);
        forceFoundationBrake = f1 * f2;
    end
    
    forceEngineBrake = gearFactors(gear);

    totalForce = forceGravity - forceFoundationBrake - forceEngineBrake; 
    acceleration = totalForce / truckMass;
    
end