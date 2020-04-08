function plot_nav(truth, est, plotType)

figure()
if strcmp(plotType, 'crv')
    plot(est(:, 2), est(:, 1),'linewidth', 2, 'DisplayName', 'Nav')
    hold on
    plot(truth(:, 2), truth(:, 1),'linewidth', 2, 'DisplayName', 'Truth')
    xlabel('d_T, km')
    ylabel('d_R, km')
    title('Relative Position to NXS Sat in Curvilinear Frame')
    set ( gca, 'xdir', 'reverse' )
    legend('Location', 'best')
    hold off
elseif strcmp(plotType, 'roe')
    plot(est(:, 3), est(:, 2),'linewidth', 2, 'DisplayName', 'Nav')
    hold on
    plot(truth(:, 3), truth(:, 2),'linewidth', 2, 'DisplayName', 'Truth')
    legend('location', 'best')
    
    hold off
end

