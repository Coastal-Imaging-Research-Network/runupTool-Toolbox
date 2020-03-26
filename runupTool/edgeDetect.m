function edgeDetect()
set(gcf,'Pointer','watch');
handle = get (gcf,'userData'); % retreive from the cache
background           = get (handle.backgroundIntensityTag, 'UserData');
currentData          = get (handle.forwardButtonTag,       'UserData');
dline                = get (handle.edgeButtonTag,          'UserData');
stackData            = get (handle.backButtonTag,          'UserData');
P                    = get (handle.maxRundown,             'UserData'); 

screenNumber = currentData.scrnum;
offset = currentData.offset;

if (currentData.scrnum == 1)
    set(gcf,'Pointer','arrow');
    edgeDetectfirst;
    return
end

rows  = screen(screenNumber);       %recalculate the Y axis..

Seed  = dline(rows(offset));

rows = rows(offset+1:length(rows));

I     =  stackData.data(rows, :);       %grab the data from the stack..
IBack = background.IBack(rows,:);

Ri(1)= findRunupEdge(I(1,:),IBack(1,:), Seed,P); 

for i = 2:length(rows)
Ri(i)= findRunupEdge(I(i,:),IBack(i,:), Ri(i-1),P);
end

dline(rows(1:end)) = Ri(1:end);

set (handle.edgeButtonTag,'UserData',dline);
set(gcf,'Pointer','arrow');
%
% Copyright by Oregon State University, 2002
% Developed through collaborative effort of the Argus Users Group
% For official use by the Argus Users Group or other licensed activities.
%
% $Id: edgeDetect.m,v 1.1 2004/08/20 20:17:12 stanley Exp $
%
% $Log: edgeDetect.m,v $
% Revision 1.1  2004/08/20 20:17:12  stanley
% Initial revision
%
%
%key internal runup 
%comment  
%
