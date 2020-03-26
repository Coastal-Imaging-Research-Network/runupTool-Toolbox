%% demo_runupTool - wrapper for tool
% this file sets initial paths and parameters for using
% 'extractRunup_Timeseries.m', which in turn 'runupTool.m'

%move to the directory where files are located

%add paths for runupTool code (and supporting files)
addpath runupTool\

%% run the tool
%example 1
year=2020;
month= 01;
day  = 05;
yrunup=[90]; %alongshore locations of runup time stack
extractRunup_Timeseries(year,month,day,yrunup)

%% example 2
year=2017;
month= 11;
day  = 07;
yrunup=[945]; %alongshore locations of runup time stack
extractRunup_Timeseries(year,month,day,yrunup)

%% example 3
year=2019;
month= 11;
day  = 16;
yrunup=[90]; %alongshore locations of runup time stack
extractRunup_Timeseries(year,month,day,yrunup)


