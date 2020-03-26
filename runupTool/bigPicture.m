function bigPicture
% This is sorta the brain of the runuptool. This decides if the runup
% transect already has a Ri listed, and then displays it if the line does
% not exist either.. it also does an initial bg or continuting bg calculation
% if the toggle is thrown. 

set(gcf, 'Pointer', 'watch');
handle = get (gcf,'userData'); % retreive from the cache
background           = get (handle.backgroundIntensityTag, 'UserData');
currentData          = get (handle.forwardButtonTag, 'UserData');
dline                = get (handle.edgeButtonTag, 'UserData');

screenNumber = currentData.scrnum;
rows  = screen(screenNumber);  
hl = findobj(gcf, 'Type', 'line');

%do we have a bg profile? if not make one.
try
dummyVariable=background.IBack(rows,:);
catch
    if screenNumber ==1
        firstBackground
    else 
        findBackground
    end
end

%do we have an Ri? if not make one.
try
dE= dline(rows);
catch
     if screenNumber ==1
        edgeDetectfirst
    else 
        edgeDetect;
    end
end
%do we have a line? if not make one..

if isempty(hl)
    makeLine;
end

displayImage; 

set(gcf, 'Pointer', 'arrow');

%
% Copyright by Oregon State University, 2002
% Developed through collaborative effort of the Argus Users Group
% For official use by the Argus Users Group or other licensed activities.
%
% $Id: bigPicture.m,v 1.1 2004/08/20 20:17:11 stanley Exp $
%
% $Log: bigPicture.m,v $
% Revision 1.1  2004/08/20 20:17:11  stanley
% Initial revision
%
%
%key internal runup 
%comment  
%
