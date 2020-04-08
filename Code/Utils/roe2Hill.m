function [rv_Hill, ud] = roe2Hill(roe, chief_oe)
rad2deg = 180 / pi;

da = roe(2);
dL = roe(3);
dex = roe(4);
dey = roe(5);
dix = roe(6);
diy = roe(7);

ad = da * chief_oe.a + chief_oe.a;
edx = dex + chief_oe.e * cos(chief_oe.w);
edy = dey + chief_oe.e * sin(chief_oe.w);

ed = sqrt(edx ^ 2 + edy ^ 2);

id = dix * rad2deg + chief_oe.inc * rad2deg;

od = diy / sin(chief_oe.inc) * rad2deg + chief_oe.omega;
wd = atan2d(edy, edx);

ud = dL * rad2deg - diy*rad2deg/sin(chief_oe.inc) * cos(chief_oe.inc) + (chief_oe.nu + chief_oe.w) * rad2deg;
nud = ud - wd;
[rTgt,vTgt] = oe2rvECI(chief_oe.a, chief_oe.e, chief_oe.inc * rad2deg, chief_oe.omega * rad2deg,...
    chief_oe.w * rad2deg, chief_oe.nu * rad2deg);
[rChase,vChase] = oe2rvECI(ad,ed,id,od,wd,nud);

[rHill,vHill] = ECI2Hill_Vectorized(rTgt,vTgt,rChase,vChase);

rv_Hill = [rHill; vHill];
