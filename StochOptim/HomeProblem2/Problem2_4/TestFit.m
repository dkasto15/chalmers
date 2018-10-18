functionData = LoadFunctionData;
x = functionData(:,1);
y = functionData(:,2);

variableRegister = [0, 0, 0];
constantRegister = [1, 3, -1];
operandRegister = [variableRegister, constantRegister];
maxChromosomeLength = 180;
divisionByZeroConstant = realmax;

yHat = bestCurveFit(x);
chromosome = load('bestIndividualAllGenerations.mat');
chromosome = chromosome.bestIndividualAllGenerations;

fitness = EvaluateIndividual(chromosome, operandRegister,...
            maxChromosomeLength, divisionByZeroConstant);
rootMeanSquareError = 1 / fitness;
disp('Root mean square error');
disp(rootMeanSquareError);

figure
plot(x,y, '-', 'DisplayName', 'Objective function')
hold on
plot(x,yHat, '.', 'DisplayName', ['LGP with root mean square error ' num2str(rootMeanSquareError)])
xlabel('x');
ylabel('y');
legend
grid on