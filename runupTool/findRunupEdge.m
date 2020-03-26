function [Ri] = findRunupEdge(I, IBack, RiOld,P)
%
%	[Ri, IBack] = findRunupEdge(I, IBack, RiOld, P)
%
%  Returns the estimated run-up location (index value i of the edge pixel)
%  for an intensity transect, I.  A particular pixel is chosen that is 
%  the landward-most pixel whose intensity difference above the background
%  intensity transect, IBack, exceeds a threshold.  The Threshold
%  values are included in the parameter structure, P.  The threshold 
%  for uprush is usually larger (uprushing waves have a brighter edge).
%  An uprushing wave is one that would occur shoreward of the previous 
%  value for runup, RiOld.  The background intensity profile, IBack, 
%  is also updated.

I = double(I); IBack = double(IBack);

dI = I - IBack;
thresh = [repmat(P.IThreshUp, 1, RiOld)...
          repmat(P.IThreshDown, 1, size(I,2)-RiOld)];
Ri = min(find((dI - thresh) > 0));
if isempty(Ri)
    Ri = size(I,2);
end
Ri = min(Ri, RiOld + P.maxRundown);	% stop a runaway

%
% Copyright by Oregon State University, 2002
% Developed through collaborative effort of the Argus Users Group
% For official use by the Argus Users Group or other licensed activities.
%
% $Id: findRunupEdge.m,v 1.2 2004/09/03 17:28:45 stanley Exp $
%
% $Log: findRunupEdge.m,v $
% Revision 1.2  2004/09/03 17:28:45  stanley
% added cast
%
% Revision 1.1  2004/08/20 20:17:15  stanley
% Initial revision
%
%
%key internal runup 
%comment  
%
