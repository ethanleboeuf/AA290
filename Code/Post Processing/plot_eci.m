function plot_eci(NXS_out,astro_out, modes)

ENUMS = get_enums();
figure()
for ii = 0 : modes(end)
    inter = modes == ii;
    if sum(inter) < 5
        plot3(astro_out(inter, 1), astro_out(inter, 2), astro_out(inter, 3),...
            '*', 'DisplayName', ENUMS.modes.guid{ii+1}, 'LineWidth', 2)
    else
        plot3(astro_out(inter, 1), astro_out(inter, 2), astro_out(inter, 3),...
            'DisplayName', ENUMS.modes.guid{ii+1}, 'LineWidth', 2)
    end
    
    hold on
end


plot3(NXS_out(:, 1), NXS_out(:, 2), NXS_out(:, 3),'r', 'LineWidth', 2, 'DisplayName', 'NXS');
hold on
% plot3(astro_out(:, 1), astro_out(:, 2), astro_out(:, 3),'g', 'LineWidth', 2);
[x , y, z] = ellipsoid(0, 0, 0, 6378.14 , 6378.14, 6378.14, 20);
surface(x, y , z ,'FaceColor','blue','EdgeColor','black', 'DisplayName', 'Earth');
axis  equal;
xlabel('I, km')
ylabel('J, km')
zlabel('K, km')
title('Satellite Positions in ECI')
legend
hold off


end

