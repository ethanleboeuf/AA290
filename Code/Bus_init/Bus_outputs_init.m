%% Bus structure for constants


busCell = { ...
        { ...
            'Bus_outputs', ...
            {{'NXS_out',1,'Bus_state', -1,'real','Sample', 'Fixed', [], [], '','' }; ...
            {'astro_out',1,'Bus_state', -1,'real','Sample', 'Fixed', [], [], '','' }; ...
            }, ...
        };
};

Simulink.Bus.cellToObject(busCell);