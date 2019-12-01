function astro = astro_ic(NXS, CON)
astro = evalin('base','Simulink.Bus.createMATLABStruct({''Bus_sat''})');
eci2rtn = rv2RTN(NXS.ic.r_i, NXS.ic.v_i);
[a,ecc,inc,omega,w,nu] = rvECI2oe(NXS.ic.r_i, NXS.ic.v_i, CON.mu);
Rc = norm(NXS.ic.r_i);

rel_vect = [2; 15; 0];
% [r_rect, v_rect] = curv2rect(rel_vect, v_curv, Rc)

a = a + rel_vect(1) ;
% ecc = 0.005;
% ecc = 0.005;
% ecc = 0.1;
% inc = inc + 0.1;
theta = rel_vect(2) / norm(NXS.ic.r_i);
nu = wrapTo360(nu + theta * 180 / pi);
% inc = 46.1;

[astro.ic.r_i, astro.ic.v_i] = oe2rvECI(a,ecc,inc,omega,w,nu);
astro.ic.a_i = zeros(3, 1); %dummy for init;
astro.ic.q_b_i_b = zeros(4,1);
astro.Cd = 2.2;
astro.B = pi * 1.79^2 / 1090;

astro.OE.a = a;
astro.OE.e = ecc;
astro.OE.inc = inc;
astro.OE.omega = omega;
astro.OE.w = w;
astro.OE.nu = nu;

end