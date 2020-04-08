function A = cw_state_matrix(n, t)
cnt = cos(n*t);
snt = sin(n*t);
A = [4 - 3*cnt, 0, 0, snt/n, 2/n - 2*cnt/n, 0;
    -6*n*t + 6*snt, 1, 0, -2/n+2*cnt/n, 4*snt/n-3*t, 0;
    0, 0, cnt, 0, 0, snt/n;
    3*n*snt, 0, 0, cnt, 2*snt, 0;
    -6*n+6*n*cnt, 0, 0, -2*snt, -3+4*cnt, 0;
    0, 0, -n*snt, 0, 0, cnt];
end

