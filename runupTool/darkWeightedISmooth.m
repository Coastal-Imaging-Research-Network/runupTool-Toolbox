function IBack = darkWeightedISmooth(I, IBack, P)
%
%	IBack = darkWeightedISmooth(I, IBack, P)
%
%  Routine to find the running-average background intensity profile
%  for a run-up stack.  I, the current VECTOR of intensities, is 
%  averaged with the past running average, IBack, with the equation
%
%     IBack = (NFilt * IBack + I) / (Nfilt + 1)
%
%  Nfilt, the filter weight, varies between a small number when I 
%  is darker than IBack (rapid response to a dark background) and a large
%  number with I is lighter than IBack (slow response to lightening 
%  conditions.  The intent is to find the dark background of a beach
%  that underlies passing swash.  P is a structure containing the
%  filter weights and other parameters.

I = double(I); IBack = double(IBack);
NFilt = repmat(P.NFiltLight, size(I));
dark = find((I-IBack) < 0);
NFilt(dark) = repmat(P.NFiltDark, size(dark));
IBack = (NFilt .* IBack + I) ./ (NFilt + 1);

%
% Copyright by Oregon State University, 2002
% Developed through collaborative effort of the Argus Users Group
% For official use by the Argus Users Group or other licensed activities.
%
% $Id: darkWeightedISmooth.m,v 1.2 2004/09/03 16:50:24 stanley Exp $
%
% $Log: darkWeightedISmooth.m,v $
% Revision 1.2  2004/09/03 16:50:24  stanley
% cast input to double, since loadStack returns uint8 now
%
% Revision 1.1  2004/08/20 20:17:12  stanley
% Initial revision
%
%
%key internal runup 
%comment  
%
