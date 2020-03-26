function setmaxRundown()

% This function for the maximum rundown. It gets the value
% from a slider on the GUI, and updates the edge and redraws the 
% detected edge. The rundown value is the maximum value that the 
% detected edge can travel from left to right. there are no current
% limits on the rates of right to left travel. the purpose of this 
% is for when the backwash, or intensity of the runup as it is traveling
% downward is weak,(dim edge) or also even when the water actually sinks
% into the sand, this will still draw an interpretive, objective line.

handle = guihandles(gca);

P                  = get (handle.maxRundown,       'UserData');
currentData        = get (handle.forwardButtonTag, 'UserData');
P.maxRundown = round(get (handle.maxRundown,       'value'));

valmaxRundown = parameters('valmaxRundown');
b=uicontrol('Parent',gcf, 'style', 'text','units',...
    'normalized','position',valmaxRundown.position, ...
    'BackgroundColor',valmaxRundown.bcolor,'string',P.maxRundown);

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
% $Id: setmaxRundown.m,v 1.1 2004/08/20 20:17:24 stanley Exp $
%
% $Log: setmaxRundown.m,v $
% Revision 1.1  2004/08/20 20:17:24  stanley
% Initial revision
%
%
%key internal runup 
%comment  
%
