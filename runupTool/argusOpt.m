function value = argusOpt( field, DBname )
% argusOpt -- limited number of option values for Argus code
%
%  value = argusOpt( field ) returns the value for the specific
%   requested piece of information. Current values for field are:
%
%    imageArchive - location of the root of the image archive
%    user         - user name
%    userHome     - location where tools can store status information
%    timeOffset   - offset between GMT and standard time at user's
%                   location -- NOT necessarily any specific station's.
%    timeZoneString - string representing standard time at user's
%                   - location. E.g., at OSU, we are -480 and PST.
%    fieldDataRoot - root of field data.
%

switch lower( field )
    case 'imagearchive'
        %value = '/ftp/pub';
        % get files from here
        % C:\temp\argus\pub\argus02a\2011\cx\240_Aug.28
        %value = 'c:/temp/argus/pub';
        value = 'c:/temp/argus/pub'; % so ftpdir is same as this
    case 'user'
        value = getenv('username');% getenv('USER');
    case 'timeoffset'
        % PST, 8 HOURS value = -480;
        value = -300; % EST
    case 'timezonestring'
        value = 'EST';
    case 'userhome'
        value = [ getenv('HOME') filesep '.argusToolHome' ];
        if exist( value, 'dir' ) ~= 7
            system( [ 'mkdir ' value ] );
        end;
    case 'fielddataroot'
        %value = '/ftp/pub';
        value = 'c:';
end;

%% available in windows
% AGSDESKTOPJAVA=C:\ArcGIS\Desktop10.2\
% ALLUSERSPROFILE=C:\ProgramData
% APPDATA=C:\Users\nplant\AppData\Roaming
% CommonProgramFiles=C:\Program Files\Common Files
% CommonProgramFiles(x86)=C:\Program Files (x86)\Common Files
% CommonProgramW6432=C:\Program Files\Common Files
% COMPUTERNAME=IGSAFPESLT247
% ComSpec=C:\Windows\system32\cmd.exe
% FP_NO_HOST_CHECK=NO
% HOMEDRIVE=C:
% HOMEPATH=\Users\nplant
% LOCALAPPDATA=C:\Users\nplant\AppData\Local
% LOGONSERVER=\\IGSAFPEIDC01
% NUMBER_OF_PROCESSORS=4
% OS=Windows_NT
% Path=C:\Program Files (x86)\Intel\iCLS Client\;C:\Program Files\Intel\iCLS Cli
% dows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Program File
% nts\DAL;C:\Program Files\Intel\Intel(R) Management Engine Components\IPT;C:\Pr
% t Engine Components\DAL;C:\Program Files (x86)\Intel\Intel(R) Management Engin
% I Technologies\ATI.ACE\Core-Static;C:\Program Files (x86)\Intel\OpenCL SDK\3.0
% CL SDK\3.0\bin\x64;C:\ArcGIS\gbin;C:\Program Files\TortoiseSVN\bin;C:\Program
% ogram Files (x86)\Google\Google Apps Migration\;C:\Program Files\MATLAB\R2014a
% 14a\bin;C:\Program Files (x86)\MiKTeX 2.9\miktex\bin\;C:\neticabin64b;C:\Progr
% 3\runtime\win64
% PATHEXT=.COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC
% PROCESSOR_ARCHITECTURE=AMD64
% PROCESSOR_IDENTIFIER=Intel64 Family 6 Model 60 Stepping 3, GenuineIntel
% PROCESSOR_LEVEL=6
% PROCESSOR_REVISION=3c03
% ProgramData=C:\ProgramData
% ProgramFiles=C:\Program Files
% ProgramFiles(x86)=C:\Program Files (x86)
% ProgramW6432=C:\Program Files
% PROMPT=$P$G
% PSModulePath=C:\Windows\system32\WindowsPowerShell\v1.0\Modules\
% PUBLIC=C:\Users\Public
% SESSIONNAME=Console
% SystemDrive=C:
% SystemRoot=C:\Windows
% TEMP=C:\Users\nplant\AppData\Local\Temp
% TMP=C:\Users\nplant\AppData\Local\Temp
% UATDATA=C:\Windows\SysWOW64\CCM\UATData\D9F8C395-CAB8-491d-B8AC-179A1FE1BE77
% USERDNSDOMAIN=GS.DOI.NET
% USERDOMAIN=GS
% USERNAME=nplant
% USERPROFILE=C:\Users\nplant
% windir=C:\Windows
% windows_tracing_flags=3
% windows_tracing_logfile=C:\BVTBin\Tests\installpackage\csilogfile.log