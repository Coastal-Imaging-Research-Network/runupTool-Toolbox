function editPoints()
% GUI callback to allow editing of pixstack edge
%if you tweak with the figure, make sure and add tweaks to
%figureStateChange!!!
try
figureStateChange('off');

hi = findobj(gcf,'Type','image');
yData = get(hi(1),'YData');

%[x,y] = editGetPoints;
x = 1;
y = 1;
q = 1;
h = 1;
hold on
while q(end)~=3
[xx,yy,qq] = ginput(1);
hh = plot(xx,yy,'x');
x = [x;xx];
y = [y;yy];
q = [q;qq];
h = [h;hh];
end
x = x(2:end);
y = y(2:end);
clear q;
delete(h(2:end));
hold off

makeUniquePears = [x, y];

if (size(makeUniquePears,1)<2)
  disp('when using edit mode, select more than one point')
  figureStateChange(1);
  return;
end;

[B,I,J]= unique(y);
y = y(I);
x = x(I);

if (min(y)<yData(1))
    x(end+1) = interp1(y,x,yData(1));
    y(end+1) = yData(1);
end
N = yData(end);
if (max(y)>yData(end))
    x(end+1) = interp1(y,x,N);
    y(end+1) = N;
end

good = find((y >= min(yData))&(y<=(max(yData))));
y = y(good);
x = x(good);

yi = [ceil(min(y)):floor(max(y))]';
xi = round(interp1(y,x,yi)); 

hl = findobj(gcf, 'Type', 'line');
hdata = get(hl,'XData')';

hdata(min(yi)-min(yData)+1:min(yi)-min(yData)+length(xi))= xi;

set(hl(1),'XData',hdata');

handle=guihandles;
updatedLine          = get(hl,'XData');
dline                = get (handle.edgeButtonTag, 'UserData');
currentData          = get (handle.forwardButtonTag, 'UserData');
stackData            = get (handle.backButtonTag, 'UserData');

updatedLine = round(updatedLine);

for x=1:length(updatedLine)
    if updatedLine(x) > length(stackData.xyz)
       updatedLine(x) = length(stackData.xyz);
    end
    if updatedLine(x) < 1
       updatedLine(x) = 1;
    end
end

screenNumber  = currentData.scrnum;
offset        = currentData.offset;
rows          = screen(screenNumber);
rows          = rows(offset+1:length(rows));

dline(rows(1:end)) = updatedLine(offset+1:end);

set(handle.edgeButtonTag, 'UserData', dline)
makeLine;
figureStateChange(1);

catch
    makeLine;
    figureStateChange(1);
end
%
% Copyright by Oregon State University, 2002
% Developed through collaborative effort of the Argus Users Group
% For official use by the Argus Users Group or other licensed activities.
%
% $Id: linearEditPoints.m,v 1.1 2004/08/20 20:17:17 stanley Exp $
%
% $Log: linearEditPoints.m,v $
% Revision 1.1  2004/08/20 20:17:17  stanley
% Initial revision
%
%
%key internal runup 
%comment  
%
