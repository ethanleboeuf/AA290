%% Bus structure for constants


busCell = { ...
        { ...
            'Bus_sat', ...
            {{'ic',1,'Bus_state', -1,'real','Sample', 'Fixed', [], [], '','' }; ...
            }, ...
        };
};

Simulink.Bus.cellToObject(busCell);