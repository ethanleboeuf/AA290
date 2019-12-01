%% Variant Controls

Dyn3DoF_variant = Simulink.Variant('DynFlag == 0');
Kepler_variant = Simulink.Variant('DynFlag == 1');

Nav_variant = Simulink.Variant('CON.NavFlag == 0');
UKF_variant = Simulink.Variant('CON.NavFlag == 1');