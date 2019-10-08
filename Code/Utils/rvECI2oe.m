function [a,e,inc,omega,w,nu] = rvECI2oe(r,v,mu)

h = cross(r,v);
evec = cross(v,h)/mu - r/norm(r);
% 
e = norm(evec);
p = norm(h)^2/mu;
a = p/(1-e^2);
n = sqrt(mu/a^3);


% hmag = norm(h);
% omega = atan2d(h(1),-h(2));
% inc = atan2d(sqrt((h(1)/hmag)^2 + (h(2)/hmag)^2),h(3)/hmag);
% 
% E = atan2d(r'*v/(n*a^2),1-norm(r)/a);
% u = atan2d(r(3)/sind(inc),r(1)*cosd(omega)+r(2)*sind(omega));
% nu = 2*atand(sqrt((1+e)/(1-e))*tand(E/2));
% 
% w = u-nu;

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
nu = acosd(evec'*r/(norm(evec)*norm(r)));
if r'*v<0
    nu = 360 - nu;
end

u = acosd(nvec'*r/(norm(r)*norm(nvec)));
if r(3)<0
    u = 360 - u;
end


end

