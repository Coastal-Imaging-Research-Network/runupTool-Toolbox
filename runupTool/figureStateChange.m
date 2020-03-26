function figureStateChange(lineIn)
%if you make any additions to the figure design, i.e. button or whatnot...
%make sure to turn them off and on and add them to the list here!!!!

handle = get (gcf,'userData'); % retreive from the cache

if lineIn == 'off';

set (handle.listbox               ,'callback',' editErrorMessage');
set (handle.NFiltDark             ,'callback',' editErrorMessage');
set (handle.NFiltLight            ,'callback',' editErrorMessage');
set (handle.maxRundown            ,'callback',' editErrorMessage');
set (handle.IThreshDown           ,'callback',' editErrorMessage');
set (handle.IThreshUp             ,'callback',' editErrorMessage');
set (handle.quitButtonTag         ,'callback',' editErrorMessage');
set (handle.saveButtonTag         ,'callback',' editErrorMessage');
set (handle.editButtonTag         ,'callback',' editErrorMessage');
set (handle.backgroundIntensityTag,'callback',' editErrorMessage');
set (handle.edgeButtonTag         ,'callback',' editErrorMessage');
set (handle.backButtonTag         ,'callback',' editErrorMessage');
set (handle.forwardButtonTag      ,'callback',' editErrorMessage');

else
set (handle.listbox               ,'callback','displayImage');
set (handle.NFiltDark             ,'callback','setNFiltDark');
set (handle.NFiltLight            ,'callback','setNFiltLight');
set (handle.maxRundown            ,'callback','setmaxRundown');
set (handle.IThreshDown           ,'callback','setIThreshDown');
set (handle.IThreshUp             ,'callback','setIThreshUp');
set (handle.quitButtonTag         ,'callback','close');
set (handle.saveButtonTag         ,'callback','saveRunup');
set (handle.editButtonTag         ,'callback','linearEditPoints');
set (handle.backgroundIntensityTag,'callback','backgroundIntensity');
set (handle.edgeButtonTag         ,'callback','edgeDetect; makeLine;');
set (handle.backButtonTag         ,'callback','showScreen(-1)');
set (handle.forwardButtonTag      ,'callback','showScreen(1) ');  

end;

%
% Copyright by Oregon State University, 2002
% Developed through collaborative effort of the Argus Users Group
% For official use by the Argus Users Group or other licensed activities.
%
% $Id: figureStateChange.m,v 1.1 2004/08/20 20:17:14 stanley Exp $
%
% $Log: figureStateChange.m,v $
% Revision 1.1  2004/08/20 20:17:14  stanley
% Initial revision
%
%
%key internal runup 
%comment  
%
