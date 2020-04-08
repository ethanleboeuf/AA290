%% Use Case for OES_rel
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
CON.dragFlag = 0;
%% Spacecraft ICs
sats.NXS = NXS_ic();
sats.astro = astro_ic(sats.NXS, CON);
sats.NXS.DynFlag = DynFlag;
sats.astro.DynFlag = DynFlag;

%% Sim Setup
variants_ic;
SimEndTime = 1.5 * 60 * 60 * 10;
TimeStep = .25;
CON.dt = TimeStep;
computer_dt = .25;
CON.computer_dt = computer_dt;
SampleTime = 5;

sim('OES_rel_YA.slx')
plot_CrvLin(ds_crv)
% hold on
% sim('OES.slx')
% plot_CrvLin(ds_crv)
% hold off



