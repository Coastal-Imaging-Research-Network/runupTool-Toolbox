function setNFiltLight()

% This function for the Intensity ratio of light. It gets the value
% from a slider on the GUI, recalculates the background and updates 
% the edge and redraws the detected edge.

handle = guihandles(gca);

P                  = get (handle.maxRundown,       'UserData');
currentData        = get (handle.forwardButtonTag, 'UserData');
P.NFiltLight = round(get(handle.NFiltLight,        'value'));

valNFiltLight = parameters('valNFiltLight');
b=uicontrol('Parent',gcf, 'style', 'text','units',...
    'normalized','position',valNFiltLight.position, ...
    'BackgroundColor',valNFiltLight.bcolor,'string',P.NFiltLight);

set (handle.maxRundown,'UserData', P)
if currentData.scrnum ==1
    edgeDetectfirst;
    firstBackground;
else
    edgeDetect;
    findBackground;
end

displayImage;
makeLine;

%
% Copyright by Oregon State University, 2002
% Developed through collaborative effort of the Argus Users Group
% For official use by the Argus Users Group or other licensed activities.
%
% $Id: setNFiltLight.m,v 1.1 2004/08/20 20:17:27 stanley Exp $
%
% $Log: setNFiltLight.m,v $
% Revision 1.1  2004/08/20 20:17:27  stanley
% Initial revision
%
%
%key internal runup 
%comment  
%
