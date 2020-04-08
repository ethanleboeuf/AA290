function plot_roe_space_prop(roe, modes)

ENUMS = get_enums();


plot_w_modes(roe.Data(2:end, 4), roe.Data(2:end, 5), modes(2:end))
xlabel('\delta e_x')
ylabel('\delta e_y')
axis equal
hold off


plot_w_modes(roe.Data(2:end, 3), roe.Data(2:end, 2), modes(2:end))
xlabel('\delta \lambda')
ylabel('\delta a')
% axis equal
hold off

plot_w_modes(roe.Data(2:end, 6), roe.Data(2:end, 7), modes(2:end))
xlabel('\delta i_x')
ylabel('\delta i_y')
% axis equal
hold off

end