function edgeDetectfirst()
set(gcf,'Pointer','watch');
handle = get (gcf,'userData'); % retreive from the cache
background           = get (handle.backgroundIntensityTag, 'UserData');
currentData          = get (handle.forwardButtonTag,       'UserData');
dline                = get (handle.edgeButtonTag,          'UserData');
stackData            = get (handle.backButtonTag,          'UserData');
P                    = get (handle.maxRundown,             'UserData'); 

if (currentData.scrnum ~= 1)
    set(gcf,'Pointer','arrow');
    return
end

rows = screen(1);                       %recalculate the Y axis..

I     =  stackData.data(rows, :);       %grab the data from the stack..
IBack = background.IBack(rows,:);
Seed  = size(I, 2);	                    % start with offshore limit

Ri(1)= findRunupEdge((I(1,:)), IBack(1,:), Seed, P);

for i =2:length(rows)
Ri(i)= findRunupEdge(I(i,:), IBack(i,:), Ri(i-1),P);
end

dline(rows(1:end)) = Ri(1:end);

set (handle.edgeButtonTag,'UserData',dline);
set(gcf,'Pointer','arrow');
%
% Copyright by Oregon State University, 2002
% Developed through collaborative effort of the Argus Users Group
% For official use by the Argus Users Group or other licensed activities.
%
% $Id: edgeDetectfirst.m,v 1.1 2004/08/20 20:17:12 stanley Exp $
%
% $Log: edgeDetectfirst.m,v $
% Revision 1.1  2004/08/20 20:17:12  stanley
% Initial revision
%
%
%key internal runup 
%comment  
%
