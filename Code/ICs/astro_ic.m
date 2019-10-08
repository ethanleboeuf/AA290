function astro = astro_ic(NXS, CON)
astro = evalin('base','Simulink.Bus.createMATLABStruct({''Bus_sat''})');
eci2rtn = rv2RTN(NXS.ic.r_i, NXS.ic.v_i);

rel_vect = [200; 100; 0];

astro.ic.r_i = eci2rtn' * rel_vect + NXS.ic.r_i;
r_hat = astro.ic.r_i / norm(astro.ic.r_i);
n_hat = cross(NXS.ic.r_i, NXS.ic.v_i) / norm(cross(NXS.ic.r_i, NXS.ic.v_i));
v_hat = cross(n_hat, r_hat);

ecc = 0.02;
p = norm(astro.ic.r_i) * (1 + ecc);
v_mag = sqrt(CON.mu * p) / norm(astro.ic.r_i);

astro.ic.v_i = v_mag * v_hat;
astro.ic.q_b_i_b = zeros(4,1);
astro.Cd = 2.2;
astro.B = pi * 1.79^2 / 1090;
end