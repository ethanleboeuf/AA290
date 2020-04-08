function [ds] = rel_eci2lvlh(chief, deputy)
r0 = chief.r_i;
r1 = deputy.r_i;
v0 = chief.v_i;
v1 = deputy.v_i;

dr = r1 - r0;
dv = deputy.v_i - chief.v_i;

h0 = cross(r0, v0);

dx = dr' * r0 / norm(r0);
dy = dr' * cross(h0, r0) / norm(cross(h0, r0));
dz = dr' * h0 / norm(h0);

dxdot = (dv' * r0 + dr' * v0) / r0 - (dr'*r0)*(dr
end

