function [ECI2RTN] = rv2RTN(r, v)
%rv2RTN Takes in position and velocity and returns the RTN (LVLH) frame
%transform at that instant

R_dir = r / norm(r);
N_dir = cross(r, v) / norm(cross(r, v));
T_dir = cross(N_dir, R_dir) / norm(cross(N_dir, R_dir));

ECI2RTN = [R_dir T_dir N_dir]';
end

