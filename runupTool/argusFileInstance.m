function savename = argusFileInstance(cfpath, parsed)
%called by runupTool
%checks to see if a file instance exists in the default save locations
%to prevent concurrency headaches.
%    fname = fileInstance(cfpath, parsed)
%       savename = saveable filename in string
%       cfpath   = current file path
%       parsed   = filename, parsed by parseFilename
%       *** assumes parsed.type(end) is the instance. follow this standard.

if cfpath(end) ~= filesep
    cfpath= [cfpath filesep];
end

D = 'not-empty'; d = 'not-empty'; % force first eval of while
parsed.type(end) = char(parsed.type(end)-1); % pre-decrement for while

% what shall I try saving this as?
savename = argusFilename(parsed);

% UNTIL both destinations don't have a file by this name ...
while ~isempty(D) || ~isempty(d)

    %increment the instance
    parsed.type(end) = char(parsed.type(end)+1);
    
    % what shall I try saving this as?
    savename = argusFilename(parsed);
    
    % where is the one I tell it to save and is there one there?
    fullname = [cfpath savename];
    D = dir (fullname);
    
    % now test against FTPPath location (final)
    checkDefault = FTPPath(savename);
    d = dir (checkDefault);
    
    
end

%
% Copyright by Oregon State University, 2002
% Developed through collaborative effort of the Argus Users Group
% For official use by the Argus Users Group or other licensed activities.
%
% $Id: argusFileInstance.m,v 1.1 2004/08/20 20:17:11 stanley Exp $
%
% $Log: argusFileInstance.m,v $
% Revision 1.1  2004/08/20 20:17:11  stanley
% Initial revision
%
%
%key internal runup 
%comment  
%
