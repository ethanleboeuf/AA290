function NXS = NXS_ic()
NXS = evalin('base','Simulink.Bus.createMATLABStruct({"Bus_sat"})');
r_a = 6869;
r_p = 6862;
inc = 46;
w = 0;
nu = 0;

a = (r_a + r_p) / 2;
ecc = (r_a - r_p) / (r_a + r_p);

[NXS.ic.r_i, NXS.ic.v_i] = oe2rvECI(a,ecc,inc,90,0,0);
NXS.ic.q_b_i_b = zeros(4,1);
end