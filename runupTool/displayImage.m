function displayImage

handle               = get (gcf,'userData'); % retreive from the cache
currentData          = get (handle.forwardButtonTag,       'UserData');
stackData            = get (handle.backButtonTag,          'UserData');
background           = get (handle.backgroundIntensityTag, 'UserData');
displaySize          = parameters('displaySize');

rows  = screen(currentData.scrnum);
I     = stackData.data(rows, :);
IBack = background.IBack(rows,:);
dI    = I - IBack;
y     = (rows(1):rows(length(rows)));

if length(rows)<50
    set (gca, 'Position', displaySize.shrunken);
else
    set (gca, 'Position', displaySize.position);
end

if (get (handle.listbox, 'Value')==1)
    h = imagesc(1, y, I);
end;
if (get (handle.listbox, 'Value')==2)
    h = imagesc(1, y, dI);
end;
if (get (handle.listbox, 'Value')==3)
    h = imagesc(1, y, IBack);  
end;

makeLine;
%
% Copyright by Oregon State University, 2002
% Developed through collaborative effort of the Argus Users Group
% For official use by the Argus Users Group or other licensed activities.
%
% $Id: displayImage.m,v 1.1 2004/08/20 20:17:12 stanley Exp $
%
% $Log: displayImage.m,v $
% Revision 1.1  2004/08/20 20:17:12  stanley
% Initial revision
%
%
%key internal runup 
%comment  
%
