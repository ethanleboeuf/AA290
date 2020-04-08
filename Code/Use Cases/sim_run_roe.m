%% Use Case for ROEs

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
CON.gravityFlag = 1;
CON.dragFlag = 0;
%% Spacecraft ICs
sats.NXS = NXS_ic();
sats.astro = astro_ic(sats.NXS, CON);
sats.NXS.DynFlag = DynFlag;
sats.astro.DynFlag = DynFlag;
roe = roe_ic(sats.NXS, sats.astro, CON);
%% Sim Setup
variants_ic;
SimEndTime = 1.5 * 60 * 60 * 1000;
TimeStep = 1;
CON.dt = TimeStep;
computer_dt = 1;
CON.computer_dt = computer_dt;
SampleTime = 5;

sim('OES_roe.slx')
plot_CrvLin(ds_crv)
% hold on
% sim('OES.slx')
% plot_CrvLin(ds_crv)
% hold off



