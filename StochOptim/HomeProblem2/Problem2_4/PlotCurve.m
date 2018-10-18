function PlotCurve(chromosome, operandRegister, divisionByZeroConstant,...
    rootMeanSquareError)
    functionData = LoadFunctionData;
    x = functionData(:,1);
    y = functionData(:,2);
    
    numberOfDataPoints = length(x);
    yHat = zeros([numberOfDataPoints, 1]);
    for i = 1:numberOfDataPoints
        operandRegister(1) = x(i);
        yHat(i) = DecodeChromosome(chromosome, operandRegister, divisionByZeroConstant);
    end

    figure
    plot(x,y, '-', 'DisplayName', 'Objective function')
    hold on
    plot(x,yHat, '.', 'DisplayName', ['LGP with root mean square error ' num2str(rootMeanSquareError)])
    xlabel('x');
    ylabel('y');
    legend
    grid on
end

