function state = i2L(chief, deputy)
    r1 = deputy.r_i;
    r0 = chief.r_i;
    v1 = deputy.v_i;
    v0 = chief.v_i;
    a0 = chief.a_i;
    h0 = cross(r0, v0);
    h0_dot = cross(r0, a0);
    dr = r1 - r0;
    dv = v1 - v0;
    
    x = dr' * r0 / norm(r0);
    y = dr' * cross(h0, r0) / norm(cross(h0, r0));
    z = dr' * h0 / norm(h0);
    xdot = (dv' * r0 + dr' * v0) / norm(r0) - (dr'*r0)*(dr'*v0)/norm(r0)^3;
    ydot = (dv'*cross(h0, r0) + dr'*(cross(h0_dot, r0) + cross(h0, v0))) / ...
        norm(cross(h0, r0)) - dr'*(cross(h0, r0)*cross(h0,r0)') * ...
        (cross(h0_dot, r0) + cross(h0, v0)) / norm(cross(h0, r0))^3;
    zdot = (dv'*h0 + dr'*h0_dot)/norm(h0) - dr'*h0*(h0'*h0_dot)/norm(h0)^3;
    state = [x;y;z;xdot;ydot;zdot];
end

