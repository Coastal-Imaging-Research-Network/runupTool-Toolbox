function setIThreshUp()

% This function for the Intensity Threshold Up. It gets the value
% from a slider on the GUI, and updates the edge and redraws the 
% detected edge.

handle = guihandles(gca);

P                  = get (handle.maxRundown,       'UserData');
currentData        = get (handle.forwardButtonTag, 'UserData');
P.IThreshUp  = round(get (handle.IThreshUp,        'value'));

valIThreshUp = parameters('valIThreshUp');

b=uicontrol('Parent',gcf, 'style', 'text','units',...
    'normalized','position',valIThreshUp.position, ...
    'BackgroundColor',valIThreshUp.bcolor,'string',P.IThreshUp);

set (handle.maxRundown,'UserData', P)
if currentData.scrnum ==1
    edgeDetectfirst;
else
    edgeDetect;
end

makeLine;

%
% Copyright by Oregon State University, 2002
% Developed through collaborative effort of the Argus Users Group
% For official use by the Argus Users Group or other licensed activities.
%
% $Id: setIThreshUp.m,v 1.1 2004/08/20 20:17:24 stanley Exp $
%
% $Log: setIThreshUp.m,v $
% Revision 1.1  2004/08/20 20:17:24  stanley
% Initial revision
%
%
%key internal runup 
%comment  
%
