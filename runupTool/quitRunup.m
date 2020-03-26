function quitRunup

answer = questdlg('Would you like to save?',...
                  'Before exiting runupTool',...
                  'Quit', 'Save', 'Cancel','Cancel');

switch (answer)
    case 'Quit',    close;
    case 'Save' ,    saveRunup;
    case 'Cancel',   return;
end;   %switch

%
% Copyright by Oregon State University, 2002
% Developed through collaborative effort of the Argus Users Group
% For official use by the Argus Users Group or other licensed activities.
%
% $Id: quitRunup.m,v 1.1 2004/08/20 20:17:19 stanley Exp $
%
% $Log: quitRunup.m,v $
% Revision 1.1  2004/08/20 20:17:19  stanley
% Initial revision
%
%
%key internal runup 
%comment  
%
