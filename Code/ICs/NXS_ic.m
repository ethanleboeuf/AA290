function NXS = NXS_ic()
NXS = evalin('base','Simulink.Bus.createMATLABStruct({''Bus_sat''})');
r_a = 6862;
% r_a = 7100;
r_p = 6862;
inc = 46;
omega = 0;
w = 30;
nu = 0;

a = (r_a + r_p) / 2;
ecc = (r_a - r_p) / (r_a + r_p);

[NXS.ic.r_i, NXS.ic.v_i] = oe2rvECI(a,ecc,inc,omega,w,nu);
NXS.ic.a_i = -3.986e5 * NXS.ic.r_i / norm(NXS.ic.r_i)^3; %dummy for init;
NXS.ic.q_b_i_b = zeros(4,1);
NXS.Cd = 2.2;
NXS.B = pi * 1.59^2 / 1090;

NXS.OE.a = a;
NXS.OE.e = ecc;
NXS.OE.inc = inc;
NXS.OE.omega = omega;
NXS.OE.w = w;
NXS.OE.nu = nu;

end