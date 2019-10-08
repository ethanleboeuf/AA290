%% Use Case for Problem Set 1
% This use case will only be used for this week as I am setting up the sim
% and working through the various needs. It will have 3-DOF of freedom and
% two spacecrafts that are just propogated through time
clear all
close all
if contains(cd, 'StanfordGrad')
    cd('C:\Users\Ethan\Documents\MATLAB\StanfordGrad\AA 290\AA290\Code')
elseif contains(cd, 'ethanl20')
    cd('C:\Users\ethanl20\Documents\MATLAB\AA290\Code')
end
load('Config_standard.mat')

%% Initial Flags (For Variants Right Now)
DynFlag = 0;
%% Initialize Buses
OES_init_bus;
CON.gravityFlag = 0;
CON.dragFlag = 1;
%% Spacecraft ICs
sats.NXS = NXS_ic();
sats.astro = astro_ic(sats.NXS, CON);
sats.NXS.DynFlag = DynFlag;
sats.astro.DynFlag = DynFlag;

%% Sim Setup
variants_ic;
SimEndTime = 24 * 60 * 60 * 50;
TimeStep = 10;
SampleTime = 540;

% sim('OES.slx')
% KeplerData.r_i = NXS_out(:, 1:3);
% KeplerData.v_i = NXS_out(:, 4:6);

DynFlag = 0;
sim('OES.slx')
NumData.r_i = NXS_out(:, 1:3);
NumData.v_i = NXS_out(:, 4:6);




