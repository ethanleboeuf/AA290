function [rho] = density_model(r, CON)
%density_model Input the position and returned the density in kg / km^3

rho = CON.rho0 * exp(-(norm(r) - CON.r0) / CON.H) / 1000 ^ 3;
end

