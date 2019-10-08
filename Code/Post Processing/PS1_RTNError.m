n = size(KeplerData.r_i, 1);
rel_state_lvlh = zeros(6, n);
for ii = 1:n
   keptemp.r_i = KeplerData.r_i(ii, :)';
   keptemp.v_i = KeplerData.v_i(ii, :)';
   numtemp.r_i = NumData.r_i(ii, :)';
   numtemp.v_i = NumData.v_i(ii, :)';
   rel_state_lvlh(:, ii) = states_i2lvlh(keptemp, numtemp);    
end

plot(rel_state_lvlh(2, :), rel_state_lvlh(1, :))