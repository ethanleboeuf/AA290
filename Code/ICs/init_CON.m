%% Initializing CON
CON = Simulink.Bus.createMATLABStruct({'Bus_CON'});

CON.mu = 3.986004e5;
CON.gravityFlag = 0; % spherical Earth
% CON.gravityFlag = 1; % J2
CON.Re = 6378.14;
CON.J2 = 1082.64e-6; 
