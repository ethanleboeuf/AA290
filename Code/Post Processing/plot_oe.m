function plot_oe(t_out, sat1,sat2, compareFlag, modes)
%plot_oe Plots the orbital elements of the two satellites
%   compareFlag allows the plots to be overlayed or not

ENUMS = get_enums();
set(0,'defaultAxesFontSize',12)
fig1 = figure();
subplot(5,1,1);
plot(t_out, sat1.a.Data)
ylabel('a, km')

subplot(5,1,2); 
plot(t_out, sat1.e.Data)
ylabel('ecc')

subplot(5,1,3); 
plot(t_out, sat1.inc.Data)
ylabel('inc, deg')

subplot(5,1,4); 
plot(t_out, sat1.omega.Data)
ylabel('\Omega, deg')

subplot(5,1,5); 
plot(t_out / 60 / 60, sat1.w.Data)
ylabel('\omega, deg')
if compareFlag
    sgtitle('Both Satellite Orbital Elements over Time')
else
    sgtitle('NXS Orbital Elements over Time')
end
xlabel('time, hours')
if compareFlag

    subplot(5,1,1);
    hold on
    plot(t_out, sat2.a.Data)
    
    subplot(5,1,2);
    hold on
    plot(t_out, sat2.e.Data)
    
    subplot(5,1,3);
    hold on
    plot(t_out, sat2.inc.Data)
    
    subplot(5,1,4);
    hold on
    plot(t_out, sat2.omega.Data)
    
    subplot(5,1,5);
    hold on
    plot(t_out, sat2.w.Data)
else
    figure()
    for ii = 0 : modes(end)
        inter = modes == ii;
        if sum(inter) < 5
            opt_plot = '*';
        else
            opt_plot = '-';
        end
        subplot(5,1,1);
        hold on
        ylabel('a, km')
        plot(t_out(inter), sat2.a.Data(inter), opt_plot, 'LineWidth', 2)

        subplot(5,1,2);
        hold on
        ylabel('ecc')
        plot(t_out(inter), sat2.e.Data(inter), opt_plot, 'LineWidth', 2)

        subplot(5,1,3);
        hold on
        ylabel('inc, deg')
        plot(t_out(inter), sat2.inc.Data(inter), opt_plot, 'LineWidth', 2)

        subplot(5,1,4);
        hold on
        ylabel('\Omega, deg')
        plot(t_out(inter), sat2.omega.Data(inter), opt_plot, 'LineWidth', 2)

        subplot(5,1,5);
        hold on
        ylabel('\omega, deg')
        plot(t_out(inter), sat2.w.Data(inter), opt_plot, 'LineWidth', 2, 'DisplayName', ENUMS.modes.guid{ii+1})
        sgtitle('Astro Orbital Elements')
        
    end
    legend('Location', 'best')
end
set(0,'defaultAxesFontSize',20)
end

