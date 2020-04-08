function oeOsc = mean2osc(oeMean, rE, J2)
% mean2osc Converts mean orbit elements to osculating orbit elements
%
%   This method is based on the first-order mapping provided in Schaub
%   Appendix G. Note that it only accounts for first-order J2 terms, and
%   thus cannot be applied to generate any general set of osculating orbit
%   elements.
%
%   Note that this method fails for perfectly circular/equatorial orbits.
%   It is recommended that a very small offset (e.g. 1E-6) is introduced to
%   the eccentricity/inclination if one wishes to evaluate the conversion
%   for a circular/equatorial orbit.
%
% Inputs:
%   oeMean - 6x1 vector of mean orbit elements:
%           a - semi-major axis of mean orbit [km]
%           e - eccentricity of mean orbit
%           i - inclination of mean orbit [deg]
%          Om - mean right ascension of the ascending node [deg]
%           w - mean argument of periapsis [deg]
%        anom - mean true anomaly [deg]
%       rE - equatorial radius of central body [km]
%       J2 - central body J2 term
%
% Outputs:
%   oeOsc - 6x1 vector of osculating orbit elements:
%          a - semi-major axis of osculating orbit [km]
%          e - eccentricity of osculating orbit
%          i - inclination of osculating orbit [deg]
%         Om - osculating right ascension of the ascending node [deg]
%          w - osculating argument of periapsis [deg]
%       anom - osculating true anomaly [deg]

% Parse out the mean orbit elements
a = oeMean(1);
e = oeMean(2);
i = oeMean(3);
Om = oeMean(4);
w = oeMean(5);
anom = oeMean(6);

% Convert all input elements from degrees to radian
i = deg2rad(i);
Om = deg2rad(Om);
w = deg2rad(w);
anom = deg2rad(anom);

% Wrap angles between -pi and pi (robustness)
i = mod(i, pi);
Om = mod(Om, 2*pi) - (Om > pi)*2*pi;
w = mod(w, 2*pi) - (w > pi)*2*pi;
anom = mod(anom, 2*pi) - (anom > pi)*2*pi;

% Convert the true anomaly to mean anomaly
E = anom2E(anom, e);
M = E2M(E, e);

% Gather necessary constants
g2 = (J2/2)*(rE/a)^2; % Note: lack of minus sign indicates mean -> osc
eta = sqrt(1 - e^2);
g2_p = g2/eta^4;

a_r = (1 + e*cos(anom))/eta^2;

% Equation G.304:
de1 = (g2_p/8)*e*eta^2*(1 - 11*cos(i)^2 - ...
    40*(cos(i)^4/(1 - 5*cos(i)^2)))*cos(2*w);
de2 = g2*((3*cos(i)^2 - 1)/eta^6)*(e*eta + e/(1 + eta) + ...
    3*cos(anom) + 3*e*cos(anom)^2 + e^2*cos(anom)^3);
de3 = g2*(3*(1 - cos(i)^2)/eta^6)*(e + 3*cos(anom) + ...
    3*e*cos(anom)^2 + e^2*cos(anom)^3)*cos(2*w + 2*anom);
de4 = -g2_p*(1 - cos(i)^2)*(3*cos(2*w + anom) + cos(2*w + 3*anom));

de = de1 + (eta^2)/2*(de2 + de3 + de4);

% Equation G.305:
di1 = -(e*de1)/(eta^2*tan(i));
di2 = g2_p/2*cos(i)*sqrt(1 - cos(i)^2)*(3*cos(2*w + 2*anom) + ...
    3*e*cos(2*w + anom) + e*cos(2*w + 3*anom));

di = di1 + di2;

% Equation G.306:
dL0 = M + w + Om;
dL1 = (g2_p/8)*eta^3*(1 - 11*cos(i)^2 - ...
    40*(cos(i)^4/(1 - 5*cos(i)^2)));
dL2 = -(g2_p/16)*(2 + e^2 - 11*(2 + 3*e^2)*cos(i)^2 - ...
    40*(2 + 5*e^2)*(cos(i)^4/(1 - 5*cos(i)^2)) - ...
    400*e^2*(cos(i)^6/(1 - 5*cos(i)^2)^2));
dL3 = (g2_p/4)*(-6*(1 - 5*cos(i)^2)*(anom - M + e*sin(anom)) + ...
    (3 - 5*cos(i)^2)*(3*sin(2*w + 2*anom) + 3*e*sin(2*w + anom) + ...
    e*sin(2*w + 3*anom)));
dL4 = -(g2_p/8)*e^2*cos(i)*(11 + 80*(cos(i)^2/(1 - 5*cos(i)^2)) +...
    200*(cos(i)^4/(1 - 5*cos(i)^2)^2));
dL5 = -(g2_p/2)*cos(i)*(6*(anom - M + e*sin(anom)) - ...
    3*sin(2*w + 2*anom) - 3*e*sin(2*w + anom) - e*sin(2*w + 3*anom));

dL = dL0 + dL1 + dL2 + dL3 + dL4 + dL5;

% Equation G.307:
edM1 = (g2_p/8)*e*eta^3*(1 - 11*cos(i)^2 - ...
    40*(cos(i)^4/(1 - 5*cos(i)^2)));
edM2 = 2*(3*cos(i)^2 - 1)*((a_r*eta)^2 + a_r + 1)*sin(anom);
edM3 = 3*(1 - cos(i)^2)*((-(a_r*eta)^2 - a_r + 1)*sin(2*w + anom) + ...
    ((a_r*eta)^2 + a_r + 1/3)*sin(2*w + 3*anom));

edM = edM1 - (g2_p/4)*eta^3*(edM2 + edM3);

% Equation G.308
dOm1 = -(g2_p/8)*e^2*cos(i)*(11 + 80*(cos(i)^2/(1 - 5*cos(i)^2)) +...
    200*(cos(i)^4/(1 - 5*cos(i)^2)^2));
dOm2 = -(g2_p/2)*cos(i)*(6*(anom - M + e*sin(anom)) - ...
    3*sin(2*w + 2*anom) - 3*e*sin(2*w + anom) - e*sin(2*w + 3*anom));

dOm = dOm1 + dOm2;

% Equations G.309-310, G.313-314
d1 = (e + de)*sin(M) + edM*cos(M);
d2 = (e + de)*cos(M) - edM*sin(M);
d3 = (sin(i/2) + cos(i/2)*(di/2))*sin(Om) + sin(i/2)*dOm*cos(Om);
d4 = (sin(i/2) + cos(i/2)*(di/2))*cos(Om) - sin(i/2)*dOm*sin(Om);

% Compute all of the osc. orbit elements using the previously computed
% parameters
aO = a + a*g2*((3*cos(i)^2 - 1)*(a_r^3 - 1/eta^3) + ...
    3*(1 - cos(i)^2)*a_r^3*cos(2*w + 2*anom));
eO = sqrt(d1^2 + d2^2);
iO = 2*asin(sqrt(d3^2 + d4^2));
OmO = mod(atan2(d3, d4), 2*pi);
MO = mod(atan2(d1, d2), 2*pi);
wO = mod(dL - MO - OmO, 2*pi);

% Convert the osc. mean anomaly to osc. true anomaly
EO = M2E(MO, e, 1E-9);
anomO = E2anom(EO, e);

% Convert all osc. orbit elements from radians to degrees
iO = rad2deg(iO);
OmO = rad2deg(OmO);
wO = rad2deg(wO);
anomO = rad2deg(anomO);

% Gather the osc. orbit elements into one vector
oeOsc = [aO; eO; iO; OmO; wO; anomO];

end

