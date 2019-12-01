%% Initializing CON
CON = Simulink.Bus.createMATLABStruct({'Bus_CON'});

CON.mu = 3.986004e5;
CON.gravityFlag = 0; % spherical Earth
% CON.gravityFlag = 1; % J2
CON.Re = 6378.14;
CON.J2 = 1082.64e-6; 
CON.density.r0 = CON.Re;
CON.density.rho0 = 1.225;
CON.density.H = 7.64 * 1000;
CON.guidFlag = 1;
CON.NavFlag = 0;
CON.lambda = 3;
CON.Qt = eye(7) * 1e-10;
CON.Rt = eye(6);
CON.Rt(1:3, 1:3) = CON.Rt(1:3, 1:3) * 1;
CON.Rt(4:6, 4:6) = CON.Rt(4:6, 4:6) * 1e-1;