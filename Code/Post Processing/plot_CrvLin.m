function  plot_CrvLin(ds_crv, modes)

ENUMS = get_enums();

plot_w_modes(ds_crv(:, 2), ds_crv(:, 1), modes)
hold on
xlabel('d_T, km')
ylabel('d_R, km')
title('Relative Position to NXS Sat in Curvilinear Frame')
set ( gca, 'xdir', 'reverse' )
legend('Location', 'best')
hold off


end

