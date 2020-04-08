function roe_mean_orbit = roe2meanroe(roe, oe_c, t_out, SampleTime, CON)
n = sqrt(CON.mu / oe_c.a.Data(1)^3);
T = 2 * pi / n;

n_orbits = ceil(t_out(end) / T);

orbit_start = 2;
orbit_time_end = ceil(T / SampleTime);
roe_names = fieldnames(roe);
for jj = 1 : 7
    orbit_start = 2;
    for ii = 0 : n_orbits-1
        if orbit_start + orbit_time_end > length(roe.da.Data)
            orbit_end = length(roe.da.Data);
        else
            orbit_end = orbit_start + orbit_time_end;
        end

        roe_mean_orbit(ii+1, jj) = mean(roe.(roe_names{jj}).Data(orbit_start : orbit_end ));
        orbit_start = orbit_end + 1;
    end

end

