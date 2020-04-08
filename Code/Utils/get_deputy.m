function [deputy] = get_deputy(chief, ds_i)
%i2cur Takes in inertial states of the chief and a given offset to return
%the inertial state of the deputy



R = norm(chief.r_i);

i2lvlh = rv2RTN(chief.r_i, chief.v_i);

dx = ds_i(1);
dy = ds_i(2);
dz = ds_i(3);

dx_dot = ds_i(4);
dy_dot = ds_i(5);
dz_dot = ds_i(6);

R1 = norm([R + dx ; dy; dz]);

ds_crv = zeros(6, 1);


phi = atan2(dy, R + dx);
psi = asin(dz / R1);

ds_crv(1) = R1 - R;
ds_crv(2) = R * phi;
ds_crv(3) = R * psi;

R_dot = (i2lvlh * chief.v_i)' * (i2lvlh * chief.r_i) / R;
R1_dot = sqrt((R_dot + dx_dot)^2 + dy_dot^2 + dz_dot^2);

phi_dot = (dy_dot * (R + dx) - dy * (R_dot + dx_dot)) / ...
    (dy^2 + (R + dx)^2);
psi_dot = (dz_dot*R1 - dz * R1_dot) / R1^2 * sqrt(1 + (dz^2 / (dy^2 + (R + dx)^2)));

ds_crv(4) = R1_dot - R_dot;
ds_crv(5) = R_dot * phi + R * phi_dot;
ds_crv(6) = R_dot * psi + R * psi_dot;

end

