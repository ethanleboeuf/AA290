function roe = roe_ic(chief, deputy, CON)


roe = evalin('base','Simulink.Bus.createMATLABStruct({''Bus_roe''})');

[ac,ec,ic,oc,wc,~, uc] = rvECI2oe_rad(chief.ic.r_i, chief.ic.v_i, CON.mu);
[ad,ed,id,od,wd,~, ud] = rvECI2oe_rad(deputy.ic.r_i, deputy.ic.v_i, CON.mu);

roe.adot = 0;
roe.da = (ad - ac) / ac;
roe.dL = (ud - uc) + (od - oc) * cos(ic);
roe.dex = ed * cos(wd) - ec * cos(wc);
roe.dey = ed * sin(wd) - ec * sin(wc);
roe.dix = id - ic;
roe.diy = (od - oc) * sin(ic);
end

