function [dv, um2] = two_burn_roe(da, de, dL, um1, a, mu, xi)

na4 = sqrt(mu / a^3) * a / 4;
um1mxi = um1 - xi;
c_um_xi = cos(um1mxi);
s_um_xi = sin(um1mxi);
b = [na4 * (da + de * c_um_xi);...
    na4 * 2 * (-dL / 2 + de * s_um_xi);...
    na4 * (da - de * c_um_xi);...
    na4 * 2 * (-dL/2 - de * s_um_xi)];

A = eye(4, 5) ;
A(1, 5) = na4 * (dL/2 + de * s_um_xi);
A(2, 5) = na4 * 2 * (da - de * c_um_xi);
A(3, 5) = - na4 * (dL/2 + de * s_um_xi);
A(4, 5) = - na4 * 2 * (da - de * c_um_xi);
% 
% x = A\b;
% 
% dv = x(1:4);
% chi = x(5);
% 
% del = atan2(2 * chi, chi^2 - 1);
% um2 = del + um1;
del = pi/100;
um2 = del + um1;
X = sin(del)/(cos(del) - 1);
dv = zeros(4, 1);
dv(1) = b(1) - X * A(1,5);
dv(2) = b(2) - X * A(2,5);
dv(3) = b(3) - X * A(3,5);
dv(4) = b(4) - X * A(4,5);

end

