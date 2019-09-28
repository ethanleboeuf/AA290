%% Plotting Script for Problem Set 1

plot3(NXS_out(:, 1), NXS_out(:, 2), NXS_out(:, 3),'r', 'LineWidth', 2);
hold on
plot3(astro_out(:, 1), astro_out(:, 2), astro_out(:, 3),'g', 'LineWidth', 2);
[x , y, z] = ellipsoid(0, 0, 0, 6378.14 , 6378.14, 6378.14, 20);
surface(x, y , z ,'FaceColor','blue','EdgeColor','black');
axis  equal;