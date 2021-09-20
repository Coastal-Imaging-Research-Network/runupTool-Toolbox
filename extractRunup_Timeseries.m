
%% 
%Extract runup from timestacks using 'runupTool.m'
%
%Input:
%   dataDIR = full directory path where timestacks are located
%   saveDIR = full directory path where timeseries are saved
%
%   - date info
%   - alongshore locations of runup timestacks
%
%Output:
%   - saves runup timeseries data to .mat file (same name as timestack with .runup)
%
% Written by: Jenna Brown, USGS, 2017
% Updated by: Justin Birchler, USGS, 2020
%
%--------------------------------------------------------------------------
function extractRunup_Timeseries(year,month,day,yrunup)
close all
clc

%***Input:
% year=2019;
% month= 11;
% day  = 16;
% yrunup=[90]; %[90, 945] = alongshore locations of runup pixel lines/timestacks

%---timestack files located at:
dataDIR = [pwd,'/data/',num2str(year),'/cx'];

%---save runup timeseries files to:
saveDIR = [pwd,'/runup/',num2str(year)];%,'/'];

%--------------------------------------------------------------------------

yearday=num2str(datenum(year,month,day)-datenum(year-1,12,31),'%3.3d');
monthName=datestr([year,month,day,0,0,0],'mmm');
dayStr=num2str(day,'%2.2d');
dirName = [yearday '_' monthName '.' dayStr];

dataPath = [dataDIR '/' dirName ];
savePath = [saveDIR '/' dirName];
if ~exist(savePath)
    mkdir(savePath)
end

%---for each alongshore runup location:
for yy=1:length(yrunup)
    
    S = dironly([dataPath '/*runup' num2str(yrunup(yy)) '.mat']);
    
    for ss=1:length(S)
        stackFile = [dataPath '/' S(ss).name];
        file=parseFilename(stackFile,'noLocal');
        runupFile=[file.time '.' file.when '.' file.station '.c' file.camera '.' file.type '.runup.mat'];
        % runupFile=[file.time '.' file.when '.' file.station '.c' file.camera '.r' num2str(yrunup(yy)) '.runup.mat'];
        if ~exist([savePath '/' runupFile ])
            
            figure('Name',S(ss).name);
            S(ss).name
            runupTool([dataPath '/' S(ss).name],savePath)
            
            if ss==length(S)
                keyboard
            end
        else
            disp([ stackFile ' has been processed']);
        end
    end
end

%% REDO RUNUP EXTRACTION TO CORRECT FOR ERRORS
if (0)
    clear,close all
     
   cd(saveDIR) %then cd to a single date
   files = dir('*runup.mat');
   savePath = pwd
     
   for  ii = 1:length(files)
       imageName = files(ii).name
       runupTool(imageName,savePath)
       keyboard
   end
     
end
function D = dironly(directory_name)

D=dir(directory_name); 

D=D(~strncmpi('.',{D.name},1));