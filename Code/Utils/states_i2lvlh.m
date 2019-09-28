function rel_state_lvlh = states_i2lvlh(chief, deputy)

i2lvlh = rv2RTN(chief.r_i, chief.v_i);

dr = deputy.r_i - chief.r_i;

rel_state_lvlh = zeros(6, 1);
rel_state_lvlh(1:3) = i2lvlh * dr;

omega = cross(chief.r_i, chief.v_i) / norm(chief.r_i)^2;
dv = deputy.v_i - chief.v_i - cross(omega, rel_state_lvlh(1:3));

rel_state_lvlh(4:6) = i2lvlh * dv;


end