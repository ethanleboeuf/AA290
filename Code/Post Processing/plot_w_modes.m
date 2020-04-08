function plot_w_modes(x, y, modes)
ENUMS = get_enums();
figure()
for ii = 0 : modes(end)
    inter = modes == ii;
    if sum(inter) < 5
        opt_plot = '*-';
        if sum(inter) == 1
            ind = find(inter);
            inter(ind(1) - 1) = 1;
            opt_plot = '*-k';
        end
    else
        opt_plot = '-';
    end
    plot(x(inter), y(inter), opt_plot, 'linewidth', 2, 'DisplayName', ENUMS.modes.guid{ii+1})
    hold on
end
plot(x(1), y(1), '*r', 'linewidth', 1, 'DisplayName', 'Start')
legend('Location', 'best')
end

