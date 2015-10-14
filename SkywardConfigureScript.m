% Author: Francescodario Cuzzocrea
% Email: francescodario.cuzzocrea@skywarder.eu

%% SKYWARD CONFIGURE SCRIPT

% Just run the script and it will install the Simulink library

ProjDir = pwd;
disp('Adding Current Path to MATLAB path three...');
addpath(ProjDir,[ProjDir,'\blocks']);
addpath(ProjDir,[ProjDir,'\blocks\GY-88']);
addpath(ProjDir,[ProjDir,'\blocks\HC-SR04']);
addpath(ProjDir,[ProjDir,'\blocks\ESC']);
savepath;
disp('Building Skyward blocks');

cd ([ProjDir,'\blocks\GY-88']);
        mex 'GY_88.c' 'GY_88_wrapper.cpp'
cd ([ProjDir,'\blocks\HC-SR04']);
        mex 'HCSR04.c' 'HCSR04_wrapper.cpp'
cd ([ProjDir,'\blocks\ESC']);
        mex 'hitec.c' 'hitec_wrapper.cpp'
                
% Complete Compilation
cd (ProjDir);
disp('Adding Skyward BLIMP Blockset Simulink...');

slxFile = 'SkywardBLIMP'; 
load_system(slxFile);
set_param(slxFile,'Lock','off');   
set_param(slxFile,'EnableLBRepository','on');  
set_param(slxFile, 'LockLinksToLibrary', 'on')
save_system(slxFile);

disp('Setup Complete ! Happy Hacking :D');
clear all
