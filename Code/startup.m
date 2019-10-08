%% Startup to bring all the folders on the path

addpath('ICs')
addpath('Bus_init')
addpath('Images_Code')
addpath('Models')
addpath('Use Cases')
addpath('Utils')
addpath('Post Processing')


myCacheFolder = fullfile(cd, 'cache');
myCodeFolder = fullfile(cd, 'codegen');

Simulink.fileGenControl('set',...
    'CacheFolder', myCacheFolder,...
    'CodeGenFolder', myCodeFolder,...
    'createDir', true)