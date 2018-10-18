function functionValue = EvaluateParticle(x)

	f1 = (x(1)^2 + x(2) - 11)^2;
	f2 = (x(1) + x(2)^2 - 7)^2;
    
    functionValue = f1 + f2;
end