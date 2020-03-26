function rows = screen(scrnum);

% calculate time and number of rows for a runup screen.
% also adds in the offset.

handle = get (gcf,'userData'); % retreive from the cache
stackData   = get(handle.backButtonTag, 'UserData');

%tWin = 70; %duration in time that you wanna see (approx)
tWin = 120;

currentData.scrnum = scrnum;

if scrnum ==1
    currentData.offset = 0;
else
    currentData.offset = 20;
end

duration = stackData.epoch(stackData.params(1).lines) - stackData.epoch(1);

deltaT = duration/(stackData.params(1).lines-1);

nRowsPerScreen = round(tWin/deltaT);
currentArea = (scrnum-1)*nRowsPerScreen;

rowMax = max ([1 currentArea]);
rowMin = min (scrnum*nRowsPerScreen, stackData.params(1).lines);
rows = [rowMax-currentData.offset:rowMin]; %add the offset in..

set (handle.forwardButtonTag,'UserData',currentData);

%
% Copyright by Oregon State University, 2002
% Developed through collaborative effort of the Argus Users Group
% For official use by the Argus Users Group or other licensed activities.
%
% $Id: screen.m,v 1.1 2004/08/20 20:17:22 stanley Exp $
%
% $Log: screen.m,v $
% Revision 1.1  2004/08/20 20:17:22  stanley
% Initial revision
%
%
%key internal runup 
%comment  
%
