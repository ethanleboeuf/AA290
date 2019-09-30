%% Use Case for Problem Set 1
% This use case will only be used for this week as I am setting up the sim
% and working through the various needs. It will have 3-DOF of freedom and
% two spacecrafts that are just propogated through time
clear all
close all
cd('C:\Users\Ethan\Documents\MATLAB\StanfordGrad\AA 290\AA290\Code')
load('Config_standard.mat')
%% Initialize Buses
OES_init_bus;
CON.gravityFlag = 1;
%% Spacecraft ICs
sats.NXS = NXS_ic();
sats.astro = astro_ic(sats.NXS, CON);

%% Sim Setup
SimEndTime = 24 * 60 * 60 * 20;
TimeStep = 100;
SampleTime = 1000;

sim('OES.slx')