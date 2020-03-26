function makeLine

h  = findobj(gcf, 'Type', 'image');
hl = findobj(gcf, 'Type', 'line');

handle = get (gcf,'userData'); % retreive from the cache
stackData            = get (handle.backButtonTag, 'UserData');
dline                = get (handle.edgeButtonTag, 'UserData');
currentData          = get (handle.forwardButtonTag, 'UserData');
displayLine          = parameters('displayLine');

rows = screen(currentData.scrnum); 

Ri = dline(rows);
% Ri = Ri+displayLine.offset; %jjb - 4/13/2017

if length(hl) > 0
    set(hl(1),'Xdata',Ri);
	set(hl(1),'Ydata',get(h(1),'Ydata'));
else
	hold on
    plot(Ri,get(h(1),'YData'),displayLine.color);
    hold off
end

%
% Copyright by Oregon State University, 2002
% Developed through collaborative effort of the Argus Users Group
% For official use by the Argus Users Group or other licensed activities.
%
% $Id: makeLine.m,v 1.1 2004/08/20 20:17:18 stanley Exp $
%
% $Log: makeLine.m,v $
% Revision 1.1  2004/08/20 20:17:18  stanley
% Initial revision
%
%
%key internal runup 
%comment  
%
