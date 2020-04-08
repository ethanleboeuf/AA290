function dv = circ_burn(rel_state, n)
    t = 1800;
    A = cw_state_matrix(n, t);
    lhs = rel_state(1) - A(1, 1:3) * rel_state(1:3);
    rhs = A(1, 4:5)\lhs;
    dv = [rhs - rel_state(4:5);0];
end

