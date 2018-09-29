clear all;

populationSize = 100;
numberOfGenes = 50;
crossoverProbability = 0.8;
% mutationProbability = 1 / numberOfGenes;
tournamentSelectionParameter = 0.75;
tournamentSize = 2;
variableRange = 10;
numberOfVariables = 2;
numberOfGenerations = 100;
nCopiesBestIndividual = 1; 
fitness = zeros(populationSize,1);
nbrOfRuns = 100;

% fitnessFigureHandle = figure;
% hold on;
% set(fitnessFigureHandle, 'Position', [50,50,500,200]);
% set(fitnessFigureHandle, 'DoubleBuffer','on');
% axis([1 numberOfGenerations 2.5 3]);
% bestPlotHandle = plot(1:numberOfGenerations,zeros(1,numberOfGenerations));
% textHandle = text(30,2.6,sprintf('best: %4.3f',0.0));
% hold off;
% drawnow;

% surfaceFigureHandle = figure;
% hold on;
% set(surfaceFigureHandle, 'DoubleBuffer','on');
% delta = 0.1;
% limit = fix(2*variableRange/delta) + 1;
% [xValues,yValues] = meshgrid(-variableRange:delta:variableRange,...
%     -variableRange:delta:variableRange);
% zValues = zeros(limit,limit);
% for j = 1:limit
%     for k = 1:limit
%         zValues(j,k) = EvaluateIndividual([xValues(j,k) yValues(j,k)]);
%     end
% end
% surfl(xValues,yValues,zValues)
% colormap gray;
% shading interp;
% view([-7 -9 10]);
% decodedPopulation = zeros(populationSize, numberOfVariables);
% populationPlotHandle = plot3(decodedPopulation(:,1), ...
%     decodedPopulation(:,2),fitness(:),'kp');
% hold off;
% drawnow;

for mutationProbability = [0, 0.02, 0.05, 0.1]

    xBestVec = zeros(nbrOfRuns,2);
    maximumFitnessVec = zeros(nbrOfRuns,1);

    for run = 1:nbrOfRuns

        population = InitializePopulation(populationSize, numberOfGenes);

        for iGeneration = 1:numberOfGenerations

        %     pause(0.2); % Remember to remove this
            maximumFitness = -realmax; % Initialize with smallest possible number
                                       % to avoid fitness values >= 0 assumption
            xBest = zeros(1,2);
            bestIndividualIndex = 0;
            for i = 1:populationSize
                chromosome = population(i,:);
                x = DecodeChromosome(chromosome, numberOfVariables, variableRange);
        %         decodedPopulation(i,:) = x; 
                fitness(i) = EvaluateIndividual(x);
                if (fitness(i) > maximumFitness)
                    maximumFitness = fitness(i);
                    bestIndividualIndex = i;
                    bestIndividual = chromosome;
                    xBest = x;
                end
            end

        %     disp('xBest'); % Output suppressed. Retained for debugging.
        %     disp(xBest);
        %     disp('maximumFitness');
        %     disp(maximumFitness);

            tempPopulation = population;

            for i = 1:2:populationSize
                i1 = TournamentSelect(fitness, tournamentSelectionParameter, tournamentSize);
                i2 = TournamentSelect(fitness, tournamentSelectionParameter, tournamentSize);
                chromosome1 = population(i1,:);
                chromosome2 = population(i2,:);

                r = rand;
                if (r < crossoverProbability)
                    newChromosomePair = Cross(chromosome1, chromosome2);
                    tempPopulation(i,:) = newChromosomePair(1,:);
                    tempPopulation(i+1,:) = newChromosomePair(2,:);
                else
                    tempPopulation(i,:) = chromosome1;
                    tempPopulation(i+1,:) = chromosome2;
                end
            end

            for i = 1:populationSize
                originalChromosome = tempPopulation(i,:);
                mutatedChromosome = Mutate(originalChromosome,mutationProbability); 
                tempPopulation(i,:) = mutatedChromosome;
            end

            tempPopulation = InsertBestIndividual(tempPopulation,...
                bestIndividual,nCopiesBestIndividual);
            population = tempPopulation;

        %     plotvector = get(bestPlotHandle,'YData');
        %     plotvector(iGeneration) = maximumFitness;
        %     set(bestPlotHandle,'YData',plotvector);
        %     set(textHandle,'String',sprintf('best: %4.3f',maximumFitness));
        %     set(populationPlotHandle,'XData',decodedPopulation(:,1),'YData', ...
        %         decodedPopulation(:,2),'ZData',fitness(:));
        %     drawnow;
        end

        xBestVec(run, :) = xBest;
        maximumFitnessVec(run) = maximumFitness;
    end
    disp('mutationProbability');
    disp(mutationProbability);
    disp('Median_fitness');
    disp(median(maximumFitnessVec));
    disp('Median_x1');
    disp(median(xBestVec(:,1)));
    disp('Median_x2');
    disp(median(xBestVec(:,2)));

end
format long;
% disp('xBest');
% disp(xBest);
% disp('maximumFitness');
% disp(maximumFitness);