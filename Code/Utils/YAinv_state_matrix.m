function A = YAinv_state_matrix(f, e)
k = 1 + e * cos(f);
n = sqrt(1 - e^2);
c = k * cos(f);
s = k * sin(f);


A = 1 / n^2 * ...
    [-3*s*(k+e^2)/k^2, c-2*e, 0, -s*(k+1)/k, 0, 0;
    3*k-n^2, e*s, 0, k^2, 0, 0;
    0, 0, 0, 0, n^2 * cos(f), -n^2*sin(f);
    -3*(e+c/k), -s, 0, -(c*(k+1)/k+e), 0, 0;
    -3*e*s*(k+1)/k^2, -2+e*c, n^2, -e*s*(k+1)/k, 0, 0;
    0, 0, 0, 0, n^2*sin(f), n^2*cos(f)];
end

