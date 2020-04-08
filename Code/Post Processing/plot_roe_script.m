%% Plotting ROE
close all
% phi = zeros(size(roe_prop.Data, 1), 1);
% de = zeros(size(roe_prop.Data, 1), 1);
% for ii = 1 : size(roe_prop.Data, 1)
%     phi(ii) = atan2(roe_prop.Data(ii, 5), roe_prop.Data(ii, 4));
%     de(ii) = roe_prop.Data(ii, 5) / sin(phi(ii));
% end
% roe_mean_orbit = roe2meanroe_propv(roe_prop, orbital_elems.NXS, t_out, SampleTime, CON);
% % plot(roe_prop.Data(2:end, 4), roe_prop.Data(2:end, 5), 'LineWidth', 2)
% plot(roe_mean_orbit(:, 4), roe_mean_orbit(:, 5), 'LineWidth', 2)
% hold on
% axis equal
% xlabel('\delta e_x')
% ylabel('\delta e_y')
% hold off
% 
% figure()
% plot(roe_mean_orbit(:, 6), roe_mean_orbit(:, 7), 'LineWidth', 2)
% hold on
% axis equal
% xlabel('\delta i_x')
% ylabel('\delta i_y')
% hold off
% 
% figure()
% plot(roe_mean_orbit(:, 3), roe_mean_orbit(:, 2), 'LineWidth', 2)
% hold on
% axis equal
% xlabel('\delta \lambda')
% ylabel('\delta a')
% hold off


plot_roe_space_prop(roe_prop_truth, modes.guid.Data)
plot_roe_space_prop(roe_prop_nav, modes.guid.Data)