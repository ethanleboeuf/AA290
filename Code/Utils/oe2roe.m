function roe = oe2roe(oe_c, oe_d, anomFlag)
% oe2roe Converts absolute to relative orbital elements
%
% Inputs:
%       oe_c - chief orbital elements (all angles in degrees)
%              [a, e, i, Om, w, anom]
%       oe_d - deputy orbital elements (all angles in degrees)
%              [ad, ed, id, Omd, wd, anomd]
%   anomFlag - (optional) flag indicating whether the provided anomalies
%              are true (1 - default) or mean (0). The output set of deputy
%              OEs will match.
%
% Outputs:
%        roe - quasi-non singular relative orbital elements (all
%              non-dimensional quantities)

% Check for anomaly flag
if nargin < 3
    anomFlag = 1;
end

% Parse out the chief and deputy orbit elements
a = oe_c(1);
e = oe_c(2);
i = deg2rad(oe_c(3));
Om = deg2rad(oe_c(4));
w = deg2rad(oe_c(5));
anom = deg2rad(oe_c(6));

ad = oe_d(1);
ed = oe_d(2);
id = deg2rad(oe_d(3));
Omd = deg2rad(oe_d(4));
wd = deg2rad(oe_d(5));
anomd = deg2rad(oe_d(6));

% Gather mean anomalies and compute mean longitude
if anomFlag
    M = E2M(anom2E(anom, e), e);
    Md = E2M(anom2E(anomd, ed), ed);
else
    M = anom;
    Md = anomd;
end

u = w + M;
ud = wd + Md;

% Compute D'Amico's quasi-nonsingular ROEs
da = (ad - a)./a;
dl = (ud - u) + (Omd - Om).*cosd(i);
dex = ed.*cosd(wd) - e.*cosd(w);
dey = ed.*sind(wd) - e.*sind(w);
dix = id - i;
diy = (Omd - Om).*sind(i);

roe = [da; dl; dex; dey; dix; diy];

end

