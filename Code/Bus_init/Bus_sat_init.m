%% Bus structure for constants


busCell = { ...
        { ...
            'Bus_sat', ...
            {{'ic',1,'Bus_state', -1,'real','Sample', 'Fixed', [], [], '','' }; ...
            {'DynFlag',1,'double', -1,'real','Sample', 'Fixed', [], [], '','' }; ...
            {'B',1,'double', -1,'real','Sample', 'Fixed', [], [], 'm^2/kg','Ballistic Coefficient' }; ...
            {'Cd',1,'double', -1,'real','Sample', 'Fixed', [], [], '','Drag Coefficient' }; ...
            {'OE',1,'Bus_OE', -1,'real','Sample', 'Fixed', [], [], '','Drag Coefficient' }; ...
            }, ...
        };
        { ...
            'Bus_OE', ...
            {{'a',1,'double', -1,'real','Sample', 'Fixed', [], [], 'km','Semi-Major Axis' }; ...
            {'e',1,'double', -1,'real','Sample', 'Fixed', [], [], '','Eccentricity' }; ...
            {'inc',1,'double', -1,'real','Sample', 'Fixed', [], [], 'deg','Inclination' }; ...
            {'omega',1,'double', -1,'real','Sample', 'Fixed', [], [], 'deg','longitude of ascending node' }; ...
            {'w',1,'double', -1,'real','Sample', 'Fixed', [], [], 'deg','argument of perigee' }; ...
            {'nu',1,'double', -1,'real','Sample', 'Fixed', [], [], 'deg','true anomaly' }; ...
            }, ...
        };
};

Simulink.Bus.cellToObject(busCell);