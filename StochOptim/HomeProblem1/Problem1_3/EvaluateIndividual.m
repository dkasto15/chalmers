function fitnessValue = EvaluateIndividual(x)

	g1 = (x(1) + x(2) + 1)^2;
	g2 = 19 - 14*x(1) + 3*x(1)^2 - 14*x(2) + 6*x(1)*x(2) + 3*x(2)^2;
	g3 = (2*x(1) - 3*x(2))^2;
    g4 = 18 - 32*x(1) + 12*x(1)^2 + 48*x(2) - 36*x(1)*x(2) + 27*x(2)^2;

	g = (1 + g1*g2)*(30 + g3*g4);

    fitnessValue = 1 / g; 
end