function [a_drag] = drag_func(r, v, sat, CON)
%drag_func Input in the current velocity (ECI) and the accerlation due to drag in
%inertial frame is outputted

v_dir = v / norm(v);

rho = density_model(r, CON.density);

a_drag = - sat.B * sat.Cd * rho * norm(v) ^ 2 / 2 * v_dir;
end

