function ds_crv  = i2relRTN(sat_states)

NXS = sat_states.NXS_out;
R = norm(NXS.r_i);
astro = sat_states.astro_out;

i2lvlh = rv2RTN(NXS.r_i, NXS.v_i);

rel_state_lvlh = i2L(NXS, astro);
dx = rel_state_lvlh(1);
dy = rel_state_lvlh(2);
dz = rel_state_lvlh(3);

dx_dot = rel_state_lvlh(4);
dy_dot = rel_state_lvlh(5);
dz_dot = rel_state_lvlh(6);

R1 = norm([R + dx ; dy; dz]);

ds_crv = zeros(6, 1);


phi = atan2(dy, R + dx);
psi = asin(dz / R1);

ds_crv(1) = R1 - R;
ds_crv(2) = R * phi;
ds_crv(3) = R * psi;

R_dot = (i2lvlh * NXS.v_i)' * (i2lvlh * NXS.r_i) / R;
R1_dot = sqrt((R_dot + dx_dot)^2 + dy_dot^2 + dz_dot^2);

phi_dot = (dy_dot * (R + dx) - dy * (R_dot + dx_dot)) / ...
    (dy^2 + (R + dx)^2);
psi_dot = (dz_dot*R1 - dz * R1_dot) / R1^2 * sqrt(1 + (dz^2 / (dy^2 + (R + dx)^2)));

ds_crv(4) = R1_dot - R_dot;
ds_crv(5) = R_dot * phi + R * phi_dot;
ds_crv(6) = R_dot * psi + R * psi_dot;

end
