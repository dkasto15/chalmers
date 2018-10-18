clear all;
close all;

numberOfHiddenNeurons = 7;
numberOfOutputs = 2;
sigmoidConstant = 1;
weights = csvread('BestWeights7neurons278generations.csv');
createTestPlot = 'yes';

iDataSet = 3;
iSlope = 4;

fitness = TruckModel(weights, numberOfHiddenNeurons, numberOfOutputs,...
    sigmoidConstant, iDataSet, iSlope, createTestPlot);