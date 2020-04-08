function plot_roe_space(roe)
phi = zeros(length(roe.dex.Data), 1);
de = zeros(length(roe.dex.Data), 1);
for ii = 1 : length(roe.dex.Data)
    phi(ii) = atan2(roe.dey.Data(ii), roe.dex.Data(ii));
    de(ii) = roe.dey.Data(ii) / sin(phi(ii));
end
figure()
plot(roe.dex.Data(2:end), roe.dey.Data(2:end), 'linewidth', 2)
hold on
xlabel('dex')
xlabel('dey')
axis equal
hold off

figure()
plot(roe.dL.Data(2:end), roe.da.Data(2:end), 'linewidth', 2)
hold on
xlabel('dL')
ylabel('da')
axis equal
hold off

figure()
plot(roe.dix.Data(2:end), roe.diy.Data(2:end), 'linewidth', 2)
hold on
xlabel('dix')
ylabel('diy')
axis equal
hold off

end


