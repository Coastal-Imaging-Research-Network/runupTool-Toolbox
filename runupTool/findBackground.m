function findBackground
% This routine works through and figures out what the average
% intensity is of a particular screen, displayed on the figure.
handle = get (gcf,'userData'); % retreive from the cache
P                   = get (handle.maxRundown,             'UserData');
background          = get (handle.backgroundIntensityTag, 'UserData');
currentData         = get (handle.forwardButtonTag,       'UserData');
stackData           = get (handle.backButtonTag,          'UserData');

screenNumber= currentData.scrnum;
offset = currentData.offset;

set(gcf, 'Pointer', 'watch');
rows = screen(screenNumber);
I = stackData.data(rows, :);

%set the seed
IBack = background.IBack(rows(offset+1),:);
IBack = darkWeightedISmooth(I((offset+2),:), IBack,P);
temp.IBack = [IBack];

for i = offset+3:size(I,1)
IBack = darkWeightedISmooth(I(i,:), IBack,P);
temp.IBack= [temp.IBack; IBack];
end

background.IBack(rows(offset+2):rows(end),:)= temp.IBack(1:end,:);

set (handle.backgroundIntensityTag, 'UserData', background);
set(gcf, 'Pointer', 'arrow');

%
% Copyright by Oregon State University, 2002
% Developed through collaborative effort of the Argus Users Group
% For official use by the Argus Users Group or other licensed activities.
%
% $Id: findBackground.m,v 1.1 2004/08/20 20:17:15 stanley Exp $
%
% $Log: findBackground.m,v $
% Revision 1.1  2004/08/20 20:17:15  stanley
% Initial revision
%
%
%key internal runup 
%comment  
%
