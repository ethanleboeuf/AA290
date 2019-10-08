function NXS = NXS_ic()
NXS = evalin('base','Simulink.Bus.createMATLABStruct({''Bus_sat''})');
r_a = 6869;
% r_a = 7200;
r_p = 6862;
inc = 46;
w = 30;
nu = 0;

a = (r_a + r_p) / 2;
ecc = (r_a - r_p) / (r_a + r_p);

[NXS.ic.r_i, NXS.ic.v_i] = oe2rvECI(a,ecc,inc,90,w,nu);
NXS.ic.q_b_i_b = zeros(4,1);
NXS.Cd = 2.2;
NXS.B = pi * 1.59^2 / 1090;
end