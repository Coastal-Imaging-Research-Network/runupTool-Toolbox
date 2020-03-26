function cacheHandles(lineIn)
%caches the handles of runupTool because GUIHANDLES is slow..
% 
%                         listbox: 113.0012
%                       NFiltDark: 101.0193
%                      NFiltLight: 14.0020
%                      maxRundown: 13.0020
%                     IThreshDown: 12.0020
%                       IThreshUp: 11.0020
%          backgroundIntensityTag: 10.0020
%                   edgeButtonTag: 9.0020
%                   quitButtonTag: 8.0020
%                   saveButtonTag: 7.0020
%                   editButtonTag: 6.0020
%                   backButtonTag: 5.0020
%                forwardButtonTag: 4.0020
%                       syncroTag: 3.0051
%...stores them in root gcf

h = guihandles;

handle.listbox              = h.listbox;
handle.NFiltDark            = h.NFiltDark;
handle.NFiltLight           = h.NFiltLight;
handle.maxRundown           = h.maxRundown;
handle.IThreshDown          = h.IThreshDown;
handle.IThreshUp            = h.IThreshUp;
handle.backgroundIntensityTag = h.backgroundIntensityTag;
handle.edgeButtonTag        = h.edgeButtonTag;
handle.saveButtonTag        = h.saveButtonTag;
handle.quitButtonTag        = h.quitButtonTag;
handle.editButtonTag        = h.editButtonTag;
handle.backButtonTag        = h.backButtonTag;
handle.forwardButtonTag     = h.forwardButtonTag;
handle.syncroTag            = h.syncroTag;

set (gcf,'userData',handle);
%
% Copyright by Oregon State University, 2002
% Developed through collaborative effort of the Argus Users Group
% For official use by the Argus Users Group or other licensed activities.
%
% $Id: cacheHandles.m,v 1.1 2004/08/20 20:17:12 stanley Exp $
%
% $Log: cacheHandles.m,v $
% Revision 1.1  2004/08/20 20:17:12  stanley
% Initial revision
%
%
%key internal runup 
%comment  
%
