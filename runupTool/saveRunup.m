function saveRunup

% This function saves the runup transect that was created from the runup tool
% .. Output is described in the notes of runupTool

handles = guihandles;

saveStructure        = get (handles.saveButtonTag, 'UserData');
runup1                = get (handles.edgeButtonTag, 'UserData');
stackData            = get (handles.backButtonTag, 'UserData');
background           = get (handles.backgroundIntensityTag, 'UserData');
runup1                = runup1(:);
runup.Ri             = runup1;

foo = parseFilename(saveStructure.imageName,'noLocal');

%for i= 1:size(stackData.r,2)
%    if isequal(stackData.r.cams(i).cameraNumber,foo.camera)
%        r = stackData.r.cams(i);
%    end
%end    
%%if isempty(r)==1 
%    r = 'r Data Not Found!!!';
%    disp(r)
%end

runup.params.user      = argusOpt('user');
runup.params.imageName = saveStructure.imageName;
runup.params.instName  = saveStructure.instName;
runup.params.camera    = foo.camera;
%runup.params.r         = r;
%runup.params.version   = saveStructure.versionNumber;
runup.params.date      = epochtime;
Ri = runup.Ri;

runup.epoch  = stackData.epoch';

i  = find(Ri > size(stackData.xyz,1));
Ri(i) = size(stackData.xyz,1);
i  = find(Ri < 1);
Ri(i) = 1;

try 
reMap = saveStructure.reMap;
catch
end
if exist('reMap')
    Ri = Ri+reMap;
end

runup.xyz    = [stackData.xyz(Ri(:,end),1),stackData.xyz(Ri(:,end),2),stackData.xyz(Ri(:,end),3)];
runup.UV     = [stackData.UV(Ri(:,end),1),stackData.UV(Ri(:,end),2)];
runup.CAM     = stackData.CAM(Ri);
runup.Ri = Ri;
clear Ri;

assignin('base','runupOutput', runup);

if isempty(dir(saveStructure.outPathName))
disp ('that directory does not exist; create the directory and try again')
end

if saveStructure.outPathName(end) ~= filesep 
   saveStructure.outPathName= [saveStructure.outPathName filesep]
end

oldPath = pwd;
cd (saveStructure.outPathName); 

saveName = [saveStructure.outPathName saveStructure.savename];

d = dir (saveName);
if ~isempty(d)
    disp('flag')

ButtonName=questdlg('Are you sure you want to save over the existing file?', ...
                    'Save Over Warning', ...
                    'Yes','No','No');

switch ButtonName,
     case 'Yes', 
        save(saveName,'runup');
        disp(['save file was ' saveName])
        disp(' ');
        runup
        cd (oldPath);
     case 'No',
        disp('file not saved!!')
        cd (oldPath);
         return
end % the switch    
end % if

save(saveName,'runup');
disp(['save file was ' saveName])
disp(' ');
runup
cd (oldPath);

set (handles.saveButtonTag, 'UserData', saveStructure);

%
% Copyright by Oregon State University, 2002
% Developed through collaborative effort of the Argus Users Group
% For official use by the Argus Users Group or other licensed activities.
%
% $Id: saveRunup.m,v 1.1 2004/08/20 20:17:21 stanley Exp stanley $
%
% $Log: saveRunup.m,v $
% Revision 1.1  2004/08/20 20:17:21  stanley
% Initial revision
%
%
%key internal runup 
%comment  
%
