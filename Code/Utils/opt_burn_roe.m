function [dv1, dv2] = opt_burn_roe(da,de, n, a)

dv1 = n*a/4 * (da + norm(de));
dv2 = n*a/4 * (da - norm(de));

end

