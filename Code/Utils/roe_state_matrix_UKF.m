function A = roe_state_matrix_UKF(nc, dt, oe_c, CON)
ic = oe_c.inc;
a = oe_c.a;
ecc = oe_c.e;

wi = oe_c.w;
ex_i = ecc * cos(wi);
ey_i = ecc * cos(wi);


nu = -3/2 * nc;

eta = sqrt(1 - ecc^2);
K = 3/4 * CON.J2 * CON.Re^2 * sqrt(CON.mu) / ( (a)^(7/2) * eta^4);
F = 4 + 3 * eta;
G = 1 / eta ^ 2;
E = 1 + eta;
Q = 5 * cos(ic)^2 - 1;
T = sin(ic)^2;
S = sin(2 * ic);
P = 3 * cos(ic)^2 - 1;
wdot = K * Q;


wf = wi + wdot * dt;
ex_f = ecc * cos(wf);
ey_f = ecc * sin(wf);

A = eye(7, 7);

if CON.dragFlag == 1
    A(:, 1) = [1; dt; nu/2 * dt^2; zeros(4, 1)];
end

if CON.gravityFlag == 1
    
    A(3, 2:6) = [-(3/2 * nc + 7/2 * K * E * P)*dt,...
        1, ...
        K * ex_i * F * G * P * dt, ...
        K * ey_i * F * G * P * dt, ...
        -K * F * S * dt];
    A(4, 2:6) = [7/2 * K * ey_f * Q * dt, ...
        0, ...
        cos(wdot*dt) - 4 * K * ex_i * ey_f * G * Q * dt, ...
        -sin(wdot*dt) - 4 * K * ey_i * ey_f * G * Q * dt, ...
        5 * K * ey_f * S * dt];
    A(5, 2:6) = [-7/2 * K * ex_f * Q * dt, 0, ...
        sin(wdot*dt) + 4 * K * ex_i * ex_f * G * Q * dt, ...
        cos(wdot*dt) + 4 * K * ey_i * ex_f * G * Q * dt, ...
        -5 * K * ex_f * S * dt];
    A(7, 2:7) = [7/2 * K * S * dt,...
        0, ...
        -4 * K * ex_i * G * S * dt, ...
        -4 * K * ey_i * G * S * dt, ...
        2 * K * T * dt,...
        1];
else
    A(3, 2) = nu * dt;
end

end

