function [a,e,inc,omega,w,nu, u] = rvECI2oe_rad(r,v,mu)

h = cross(r,v);
% evec = cross(v,h)/mu - r/norm(r);
evec = ((norm(v)^2 - mu / norm(r)) * r - dot(r, v)*v) / mu;
% 
e = norm(evec);
p = norm(h)^2/mu;
a = p/(1-e^2);
n = sqrt(mu/a^3);



nvec = cross([0;0;1],h);
inc = acos(h(3)/norm(h));
omega = acos(nvec(1)/norm(nvec));
if nvec(2)<0
    omega = 2*pi-omega;
end
w = acos(nvec'*evec/(norm(nvec)*norm(evec)));
if evec(3)<0
    w = 2*pi - w;
end
nu = acos(evec'*r/(norm(evec)*norm(r)));
if r'*v<0
    nu = 2*pi - nu;
end

u = acos(nvec'*r/(norm(r)*norm(nvec)));
% E = anom2E(nu, e);
% M = E2M(E, e);
% u = w + M;
if r(3)<0
    u = 2*pi - u;
end


end

