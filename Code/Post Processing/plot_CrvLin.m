function  plot_CrvLin(ds_crv)


figure()
plot(ds_crv(:, 2), ds_crv(:, 1))
hold on
plot(ds_crv(1, 2), ds_crv(1, 1), '*r', 'LineWidth', 2)
xlabel('d_T, km')
ylabel('d_R, km')
title('Relative Position to NXS Sat in Curvilinear Frame')
set ( gca, 'xdir', 'reverse' )
hold off

end

