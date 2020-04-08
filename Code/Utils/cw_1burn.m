function dv = cw_1burn(n, t, rel_state_start, desired_pos)

A = cw_state_matrix(n, t);
lhs = desired_pos - A(1:3, 1:3) * rel_state_start(1:3);
vel_needed = A(1:3, 4:6) \ lhs;

dv = vel_needed - rel_state_start(4:6);

temp1 = desired_pos(1) - 4 * rel_state_start(1) + 3 * rel_state_start(1)*cos(n*t);
temp2 = desired_pos(2) - rel_state_start(2) + 6 * rel_state_start(1)*(n*t - sin(n*t));

vp = [sin(n*t)/n, (1-cos(n*t))*2/n; 2*(cos(n*t)-1)/n, (4*sin(n*t))/n-3*t]^-1*[temp1;temp2];

end

