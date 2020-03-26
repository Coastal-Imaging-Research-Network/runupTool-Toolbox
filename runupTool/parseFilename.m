function n = parseFilename( name, options )

% usage: n = parseFilename( 'name', options );
%
%  -- parse an argus filename into component parts
%
%  additionally, throw away any leading path info, e.g. /ftp/pub/...
%
%  e.g, '887065208.Mon.Feb.09_23:00:08.GMT.1998.argus00.c1.snap.jpg'
%  is parsed into:
%	time    887065208
%	when    Mon.Feb.09_23:00:08.GMT.1998
%	station argus00
%	camera  1
%	type    snap
%	format  jpg
%       localwhen 'Mon.Feb.09_15_00_08.PST.1998'
% 
% NOTE: most of the elements are returned as strings. That includes
% time. A simple str2num will fix that for 'ya.
%
%  OPTIONS: options is an optional string for processing output.
%    At this time, the only option is "noLocal", which tells pfn
%    that it doesn't have to make a database call for the local TZ
%    offset. (Parallel processing doesn't inherit the open database
%    connection and so a pfn will fail with "No station TZ", which is
%    a waste of time.) 
%
%

	% handle no options by creating an empty one.
	if( nargin==1 )
		options = '';
	end

	% set empty array, in case of error later
	n = [];

	% probably not a proper argus name...
	%if length(name) < 50
	%	return;
	%end

	% get only filename, ignore pathing
	f = max(find( name == filesep ));
	if ~isempty(f)
		name = name(f+1:end);
	end

	% ok, try for the time
	[h.time, remain] = strtok( name, '.' );
	remain = remain(2:length(remain));
	if isempty(h.time) | isempty(remain)
		return;
	end

	% heuristic test -- abbreviated filename has numbers in this spot
	if isempty( str2num(remain(1) ) )
		% next 5 tokens are when in english
		[a, remain] = strtok( remain, '.' );
		remain = remain(2:length(remain));
		[b, remain] = strtok( remain, '.' );
		remain = remain(2:length(remain));
		[c, remain] = strtok( remain, '.' );
		remain = remain(2:length(remain));
		[d, remain] = strtok( remain, '.' );
		remain = remain(2:length(remain));
		[e, remain] = strtok( remain, '.' );
		remain = remain(2:length(remain));

		h.when = [a '.' b '.' c '.' d '.' e];

	else
		% next token is hhmmss, which we can throw away and
		% replace with the GMT time
		[a, remain] = strtok( remain, '.' );
		h.when = epoch2GMTString( str2num(h.time) );
	end;

	if isempty( remain )
		return;
	end;

	% get station from rest
	[h.station remain] = strtok( remain, '.' );

	% if either is empty, then still not a valid name
	if isempty(remain) | isempty(h.station)
		return;
	end

	% chop off front .
	remain = remain(2:length(remain));

	% now get camera
	% special case: data files don't have camera, they have
	% things like 'bathy' or 'm0' for met.
	% IF the 'camera' starts other than 'c', make c=-1 and push
	% token back onto remain.
	[c remain] = strtok( remain, '.' );
	if( c(1) == 'c' ) 
		h.camera = str2num( c(2:length(c)) );
		% deal with cx -- data
		if isempty(h.camera)
			h.camera = c(2:length(c));
		end
	else
		h.camera = -1;
		remain = [ '.' c remain ];
	end;
	if isempty( remain )
		return;
	end;

	% chop off front .
	remain = remain(2:length(remain));

	[h.type remain] = strtok( remain, '.' );

%       raw files make end at this point, or they may have a PID here.
%       if they END, then set the remainder to '.raw' because that is
%       what it is.
	if strcmp( h.type, 'raw' )
		remain = '.raw';
		h.type = '';
	end;

	if isempty( remain )
		return;
	end;

	% chop off front .
	h.format = remain(2:length(remain));

	h.localwhen = '';
	if( isempty(strfind(options,'noLocal')) )
		% one last bit of data for user: convert file when to localtime
		h.localwhen = epoch2LocalString(str2num(h.time), h.station);
	end

	n = h;

%
% Copyright by Oregon State University, 2002
% Developed through collaborative effort of the Argus Users Group
% For official use by the Argus Users Group or other licensed activities.
%
% $Id: parseFilename.m 6 2016-02-11 00:46:00Z  $
%
% $Log: parseFilename.m,v $
% Revision 1.21  2011/08/08 00:02:45  stanley
% added 'noLocal' to avoid a DB call when unnecessary.
%
% Revision 1.20  2008/11/22 00:03:16  stanley
% change result so one token following camera is always 'format' and gives
% empty type as a result. required fix to argusFilename, too.
%
% Revision 1.19  2007/01/30 02:30:59  stanley
% added test for raw files with short names -- some are short, some are longer.
%
% Revision 1.18  2005/06/06 16:03:56  stanley
% added h.station to localwhen so localwhen has timezone info
% from wlDelft
%
% Revision 1.17  2004/10/13 18:49:18  stanley
% Deal with cx camera 'numbers'
%
% Revision 1.16  2004/03/25 16:55:41  stanley
% auto insert keywords
%
%
%key filename 
%comment  Chops argus filenmae into pieces 
%
