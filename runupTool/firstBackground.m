function firstBackground
% This routine works through and figures out what the average
% intensity is of a particular screen, displayed on the figure.
handle = get (gcf,'userData'); % retreive from the cache
P                   = get (handle.maxRundown,             'UserData');
background          = get (handle.backgroundIntensityTag, 'UserData');
currentData         = get (handle.forwardButtonTag,       'UserData');
stackData           = get (handle.backButtonTag,          'UserData');
set(gcf, 'Pointer', 'watch');

screenNumber= currentData.scrnum;

rows  = screen(screenNumber);
I     = stackData.data(rows, :);
IBack = I(size(I,1),:);	        % start with last row as seed

temp.IBack =[];

IBack = darkWeightedISmooth(I((end),:), IBack,P);
temp.IBack = [IBack];

for i = size(I,1)-1:-1:1
IBack = darkWeightedISmooth(I(i,:), IBack,P);
temp.IBack= [temp.IBack; IBack];
end

IBack = temp.IBack(end,:);
IBack = darkWeightedISmooth(I((1),:), IBack,P);
temp.IBack = [IBack];

for i = 2:size(I,1)
IBack = darkWeightedISmooth(I(i,:), IBack,P);
temp.IBack= [temp.IBack; IBack];
end

background.IBack(rows,:)= temp.IBack(1:end,:);
set (handle.backgroundIntensityTag, 'UserData', background);

set(gcf, 'Pointer', 'arrow');

%
% Copyright by Oregon State University, 2002
% Developed through collaborative effort of the Argus Users Group
% For official use by the Argus Users Group or other licensed activities.
%
% $Id: firstBackground.m,v 1.1 2004/08/20 20:17:16 stanley Exp $
%
% $Log: firstBackground.m,v $
% Revision 1.1  2004/08/20 20:17:16  stanley
% Initial revision
%
%
%key internal runup 
%comment  
%
