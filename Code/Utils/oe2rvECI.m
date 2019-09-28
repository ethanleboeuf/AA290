function [r_ECI,v_ECI] = oe2rvECI(a,e,inc,omega,w,nu)

p = a*(1-e^2);
rmag = p/(1+e*cosd(nu));
mu_earth = 3.986e5;
% 
r_PQW = [rmag*cosd(nu),rmag*sind(nu), 0]';
% v_PQW = sqrt(mu_earth/p)*[-sind(nu), (ecc+cosd(nu)), 0]';
% 
co = cosd(omega);
cw = cosd(w);
so = sind(omega);
sw = sind(w);
ci = cosd(inc);
si = sind(inc);

R_PWQ2ECI = [co*cw-so*sw*ci, -co*sw-so*cw*ci, so*si;...
            so*cw+co*sw*ci, -so*sw+co*cw*ci, -co*si;...
            sw*si, cw*si,ci];
% r_ECI = R_PWQ2ECI*r_PQW;
% v_ECI = R_PWQ2ECI*v_PQW;

n = sqrt(mu_earth/a^3);
E = acos((e+cosd(nu))/(1+e*cosd(nu)));
if nu > 180 || nu < 0
    E = 2*pi - E;
end
rPeri = [a*(cos(E) - e); a*sqrt(1-e^2)*sin(E);0];
vPeriComp = [-sin(E);sqrt(1-e^2)*cos(E);0];
VPeri = (a*n)/(1 - e*cos(E))*vPeriComp;

co = cosd(omega);
so = sind(omega);
cw = cosd(w);
sw = sind(w);
ci = cosd(inc);
si = sind(inc);


RmatZOm = [co -so 0; so co 0; 0 0 1];
RmatZw = [cw -sw 0; sw cw 0; 0 0 1];
Rmatxi = [1 0 0; 0 ci -si; 0 si ci];

R_PQW2ECI = RmatZOm * Rmatxi * RmatZw;
r_ECI = R_PQW2ECI*rPeri;
v_ECI = R_PQW2ECI*VPeri;

end

