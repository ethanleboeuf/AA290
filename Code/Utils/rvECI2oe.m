function [a,e,inc,omega,w,nu, u] = rvECI2oe(r,v,mu)

h = cross(r,v);
% evec = cross(v,h)/mu - r/norm(r);
evec = ((norm(v)^2 - mu / norm(r)) * r - dot(r, v)*v) / mu;
% 
e = norm(evec);
p = norm(h)^2/mu;
a = p/(1-e^2);
n = sqrt(mu/a^3);



nvec = cross([0;0;1],h);
inc = acosd(h(3)/norm(h));
omega = acosd(nvec(1)/norm(nvec));
if nvec(2)<0
    omega = 360-omega;
end
w = acosd(nvec'*evec/(norm(nvec)*norm(evec)));
if evec(3)<0
    w = 360 - w;
end
nu = real(acosd(evec'*r/(norm(evec)*norm(r))));
if r'*v<0
    nu = 360 - nu;
end

u = acosd(nvec'*r/(norm(r)*norm(nvec)));
if r(3)<0
    u = 360 - u;
end


end

