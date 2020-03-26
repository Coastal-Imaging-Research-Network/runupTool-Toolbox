function showScreen(lineIn)

% This function is used to move a screen forward, or a screen backwards in a runup data timeseries. 
% The 'linein' data value for a +1 moves forward, and the data value for a -1 moves backwards.
% It calls a function rows, which decides which is bigger and how much to move the screen.
% 
% The generic short paragraph about this function is to basicly not care
% about how much data is on the screen, but rather to just keep the data on
% the stack. Also this function displays the data. the prime reason that the 
% X axis below is commented out (see line 48) is because the human editable 
% form of runup requires retreival of the XYZ. It was easier to implement an 
% X axis based on pixel number rather than X axis. it is converted later. 
% 
% Comments and questions should be directed toward dclark@coas.oregonstate.edu
% Original algorithm written by Rob Holman, holman@coas.oregonstate.edu

handle = get (gcf,'userData'); % retreive from the cache
stackData            = get (handle.backButtonTag, 'UserData');
currentData          = get (handle.forwardButtonTag, 'UserData');

%most of these structures are well documented in newRunupTool, the main routine..
set(gcf, 'Pointer', 'watch');

switch (lineIn) %make your move.
case 1
    currentData.scrnum = currentData.scrnum+lineIn;
case -1
    currentData.scrnum = currentData.scrnum+lineIn;
end

if currentData.scrnum ==0 %don't fall off the back edge...
    currentData.scrnum = 1;
    set (handle.forwardButtonTag, 'UserData',currentData);
    set(gcf, 'Pointer', 'arrow');
return;
end

rows = screen(currentData.scrnum);

d = stackData.data(rows, :);

% this is how we know without knowing how long the stack is. if rows returns no data, your done.
if isempty(d)
     currentData.scrnum = currentData.scrnum-lineIn; 
     set (handle.forwardButtonTag, 'UserData',currentData);
     set(gcf, 'Pointer', 'arrow');
   return;
end
y = (rows(1):rows(length(rows)));
h = imagesc(1, y, d);
colormap gray;

displaySize = parameters('displaySize');
set (gca, 'Position',displaySize.position)

percentDone = parameters('percentDone');
percentDone.val = rows(length(rows))/length(stackData.epoch)*100;
percentDone.val = [num2str(round(percentDone.val)) ' % Completed'];

b=uicontrol('Parent',gcf, 'style', 'text','units',...
     'normalized','position',percentDone.position, ...
     'BackgroundColor',percentDone.bcolor,'string',percentDone.val);

set (handle.forwardButtonTag, 'UserData',currentData);
set(gcf, 'Pointer', 'arrow');

bigPicture; %this figures out if runup has been done on it previously, etc etc...

%
% Copyright by Oregon State University, 2002
% Developed through collaborative effort of the Argus Users Group
% For official use by the Argus Users Group or other licensed activities.
%
% $Id: showScreen.m,v 1.1 2004/08/20 20:17:27 stanley Exp stanley $
%
% $Log: showScreen.m,v $
% Revision 1.1  2004/08/20 20:17:27  stanley
% Initial revision
%
%
%key internal runup 
%comment  
%
