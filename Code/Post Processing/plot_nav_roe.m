function plot_nav_roe(truth, est)

figure()
plot(est.dL.Data(2:end), est.da.Data(2:end), '--','linewidth', 2, 'DisplayName', 'Nav')
hold on
plot(truth.dL.Data(2:end), truth.da.Data(2:end), 'linewidth', 2, 'DisplayName', 'Truth')
xlabel('dL')
ylabel('da')
legend()
% axis equal
hold off

figure()
plot(est.dix.Data(2:end), est.diy.Data(2:end), '--','linewidth', 2, 'DisplayName', 'Nav')
hold on
plot(truth.dix.Data(2:end), truth.diy.Data(2:end), 'linewidth', 2, 'DisplayName', 'Truth')
xlabel('dL')
ylabel('da')
legend()
% axis equal
hold off
