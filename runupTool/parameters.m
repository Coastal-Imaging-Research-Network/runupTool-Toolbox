function [param] = parameters(lineIn)
bg = 'white'; %themed white bg

switch lineIn
case 'P'
    % default (init) edge detect filter settings
    P.NFiltDark  = 45;,...      % for the backgroundIntensity, dark filter weight
    P.NFiltLight = 30;,...     % for the backgroundIntensity light filter weight
%     P.IThreshUp  = 5;,...      % for edgeDetect, uprush threshold
    P.IThreshUp  = 30;,...      % for edgeDetect, uprush threshold
%     P.IThreshDown= 2;,...      % for edgeDetect, downwash threshold
    P.IThreshDown= 10;,...      % for edgeDetect, downwash threshold
    P.maxRundown = 7;,...      % for edgeDetect, max run down
    param = P;

case 'spacer'
    % saving paramters
    spacer      = '.';      % just a spacer to tell each thing apart a little easier.
    param = spacer;

case 'instance'
    instance    = 'A';      % start with this instance letter
    param = instance;

case 'toolFigure'
    toolFigure.bcolor    = bg;    %bg of fig
    toolFigure.position  = [0.1 0.1 0.6 0.8];% figure size and position
    param = toolFigure;

case 'version'     
    version.position    = [.75 .95 .150 .04]; % the placement of the Version number in the figure
    version.bcolor      = bg; % make the text bg be the same as the fig
    param = version;

case 'syncro'   
    syncro.fontsize     = 25;  %the syncronization text size
    syncro.fontweight   = 'bold'; % i like it bold too
    syncro.bcolor       = bg; % make the text bg be the same as the fig
    syncro.fcolor       = 'blue';
    syncro.position     = [.777 .90 .06 .06];
    param = syncro;

case 'forward'      
    forward.fontsize    = 14;
    forward.fontweight  = 'bold';       %i like bold
    forward.bcolor      = 'white';
    forward.fcolor      = 'black';
    forward.position    = [0.75 0.005 0.090 0.150];
    param = forward;

case 'reverse'      
    reverse.fontsize    = 14;
    reverse.fontweight  = 'bold';       %i like bold
    reverse.bcolor      = 'white';
    reverse.fcolor      = 'black';
    reverse.position    = [0.75 0.68 0.090 0.150];
    param = reverse; 

case 'edit'
    edit.fontsize    = 14;
    edit.fontweight  = 'bold';       %i still like bold
    edit.bcolor      = 'blue';
    edit.fcolor      = 'white';
    edit.position    = [0.75 0.15 0.090 0.55];
    param = edit;

case 'save'
    save.fontsize    = 14;
    save.fontweight  = 'bold';       %i still like bold
    save.bcolor      = 'red';
    save.fcolor      = 'black';
    save.position    = [.85 0.45 0.150 0.10];
    param = save;

case 'quit'
    quit.fontsize    = 14;
    quit.fontweight  = 'bold';       %liking bold : continued...
    quit.bcolor      = 'red';
    quit.fcolor      = 'black';
    quit.position    = [.85 0.35 0.150 0.10];
    param = quit;

case 'setIThreshUp'
    setIThreshUp.bcolor     = bg;
    setIThreshUp.min        = 1;
    setIThreshUp.max        = 100;
    setIThreshUp.position   = [.075 .969 .449 .030];
    param = setIThreshUp; 

case 'setIThreshDown'
    setIThreshDown.bcolor   = bg;
    setIThreshDown.min      = 1;
    setIThreshDown.max      = 50;
    setIThreshDown.position = [.075 0.939 .449 .030];
    param = setIThreshDown;

case 'setmaxRundown'
    setmaxRundown.bcolor    = bg;
    setmaxRundown.min       = 1;
    setmaxRundown.max       = 50;
    setmaxRundown.position  = [.075 0.9090 .449 .030];
    param = setmaxRundown;

case 'setNFiltLight'
    setNFiltLight.bcolor    = bg;
    setNFiltLight.min       = 1;
    setNFiltLight.max       = 200;
    setNFiltLight.position  = [.075 0.8790 .449 .030];
    param = setNFiltLight;

case 'setNFiltDark' 
    setNFiltDark.bcolor     = bg;
    setNFiltDark.min        = 1;
    setNFiltDark.max        = 200;
    setNFiltDark.position   = [.075 0.8490 .449 .030];
    param = setNFiltDark;

case 'valIThreshUp' 
    valIThreshUp.bcolor     = bg;
    valIThreshUp.position   = [.004 .975 .067 .021];
    param = valIThreshUp;

case 'valIThreshDown'
    valIThreshDown.bcolor   = bg;
    valIThreshDown.position = [.004 .9450 .067 .021];
    param = valIThreshDown;

case 'valmaxRundown'
    valmaxRundown.bcolor    = bg;
    valmaxRundown.position  = [.004 0.9150 .067 .021];
    param = valmaxRundown;

case 'valNFiltLight'
    valNFiltLight.bcolor    = bg;
    valNFiltLight.position  = [.004 0.8850 .067 .021];
    param = valNFiltLight;  

case 'valNFiltDark'
    valNFiltDark.bcolor     = bg; 
    valNFiltDark.position   = [.004 0.8550 .067 .021];
    param = valNFiltDark;

case 'tagIThreshUp' 
    tagIThreshUp.bcolor     = bg;
    tagIThreshUp.position   = [.535 .975 .115 .021];
    tagIThreshUp.name       ='Uprush';
    param = tagIThreshUp;

case 'tagIThreshDown'
    tagIThreshDown.bcolor   = bg;
    tagIThreshDown.position = [.535 0.945 .115 .021];
    tagIThreshDown.name     = 'Downrush';
    param = tagIThreshDown;

case 'tagmaxRundown'
    tagmaxRundown.bcolor    = bg;
    tagmaxRundown.position  = [.535  0.915 .115 .021];
    tagmaxRundown.name      = 'Run down speed';
    param = tagmaxRundown;

case 'tagNFiltLight'
    tagNFiltLight.bcolor    = bg;
    tagNFiltLight.position  = [.535 0.8850 .115 .021];
    tagNFiltLight.name      = 'Lightening Filter';
    param = tagNFiltLight;

case 'tagNFiltDark'
    tagNFiltDark.bcolor     = bg; 
    tagNFiltDark.position   = [.535 0.8550 .115 .021];
    tagNFiltDark.name       = 'Darkening Filter';
    param = tagNFiltDark;

case 'currentDisplay'
    currentDisplay.position = [.67 .901 .08 .08];
    currentDisplay.bcolor   = bg; 
    currentDisplay.string   = 'Current Display';
    param = currentDisplay;

case 'displayImage' 
    displayImage.position   = [.67 .87 .08 .08];
    displayImage.string     = '    I |    DI |    Bg';
    displayImage.bcolor     = bg;
    param = displayImage;

case 'displaySize'  
    displaySize.position    =  [.04 .03 .7 .8];
    displaySize.shrunken    =  [.04 .03 .7 .4];
    param = displaySize;  
    set (gcf,'doublebuffer','on')
case 'percentDone'
    percentDone.position    = [.75 .85 .20 .03];
    percentDone.bcolor      = bg;
    param = percentDone;

case 'displayLine'  
    displayLine.color       = 'blue';
%     displayLine.offset      = 350;
    param = displayLine;  
end
%
% Copyright by Oregon State University, 2002
% Developed through collaborative effort of the Argus Users Group
% For official use by the Argus Users Group or other licensed activities.
%
% $Id: parameters.m,v 1.1 2004/08/20 20:17:19 stanley Exp $
%
% $Log: parameters.m,v $
% Revision 1.1  2004/08/20 20:17:19  stanley
% Initial revision
%
%
%key internal runup 
%comment  
%
