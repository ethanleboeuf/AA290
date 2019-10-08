function [E] = M2E(M,e,tol)

Eold = M;
ii = 1;
maxiter = 100;
err = 100;
Enew = M;
while err < tol && ii < maxiter
    diff = (Eold - e*sin(Eold) - M)/(1-e*cos(Eold));
    Enew = Eold - diff;
    err = abs(Enew - Eold);
    Eold = Enew;
    ii = ii + 1;
end
E = Enew;    

end

