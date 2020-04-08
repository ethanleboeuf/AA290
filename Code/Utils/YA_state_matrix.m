function [A, k] = YA_state_matrix(f, e, mu, h, dt)
k = 1 + e * cos(f);

c = k * cos(f);
s = k * sin(f);

cp = -sin(f) - e * sin(2 * f);
sp = cos(f) + e * cos(2 * f);

I = mu^2 / h^3 * (dt);

A = [s, c, 2 - 3 * e * s * I, 0, 0, 0;
    c * (1 + 1/k), -s * (1 + 1/k), -3 * k^2 * I, 1, 0, 0;
    zeros(1, 4), c / k, s/k;
    sp, cp, -3 * e * (sp * I + s / k^2), 0, 0, 0;
    -2 * s, e - 2*c, -3*(1 - 2*e*s*I), 0, 0 ,0;
    zeros(1, 4), -s / k, c/k];
end

