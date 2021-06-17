@echo off
REM Palm backup script v1.0

REM (c) 2021 Piotr Andruszkow
REM Licensed under the terms of Creative Commons CC0 1.0 Universal (https://creativecommons.org/publicdomain/zero/1.0/)

REM you may want to run this script as a scheduled task or a start-up item to ensure your backup coverage is consistent

REM BEGIN configuration section =================================


REM you will have to tweak these values to configure the script

REM where the Palm profile is located
SET srcdir="C:\Program Files\palmOne"

REM where the backup will be going. Omit the trailing slash, the script will add it automatically.
SET dstdir="<destination directory>"

REM the six-character Palm profile name. This can be found by looking for a 
REM directory that begins with the first six characters of your HotSync name in the %srcdir% 
SET palmprofilename="<six-character Palm profile name>"

REM compression level and format of the resulting backup archive. ZIP with mx9 should provide adequate compression with broad support across vendors
SET compressionlevel=9

REM configuration flag to determine whether the full copy of this script should be included with each backup. You may want to disable this if your AV is being tripped.
REM set to "y" to include. Any other value will omit the script.
SET includescriptwitharchive=y

REM END configuration section ===================================


REM BEGIN script section ========================================


REM compute the full ISO8601 timestamp in a locale-dependent fashion

REM If your locale doesn't match English (UK) with ISO8601-esque locale settings, you'll have to modify this to get a proper ISO8601 datestamp
REM time separators are dashes instead of colons. This is to avoid confusion with NTFS streams when saving the timestamp to the filename
SET isodate=%date%
SET isohour=%time:~0,2%
SET isominute=%time:~3,2%
SET isosecond=%time:~6,2%
SET timesep=-
SET isotime=%isohour%%timesep%%isominute%%timesep%%isosecond%
SET isofull=%isodate%T%isotime%


REM print a log message to indicate when compression is started
echo Started Palm backup at %isofull%

REM create archive out of the entire palmOne directory. This is so that this dir is the top-level.

REM include the following files:
REM - palm profile
REM - users.dat - as far as I know, the HotSync profile list in the application
REM - Account.dat - seemingly the email account/server configuration - not tested as I haven't set up email with my device
REM - this batch file (depending on the configuration section)

SET srcpaths=""

IF "%includescriptwitharchive%"=="y" (
    SET srcpaths=%srcdir%\%palmprofilename% %srcdir%\users.dat %srcdir%\Account.dat %0
) ELSE (
    SET srcpaths=%srcdir%\%palmprofilename% %srcdir%\users.dat %srcdir%\Account.dat
)

"C:\Program Files\7-Zip\7z.exe" a -r -mx%compressionlevel% %dstdir%\palm-profile-backup-%isofull%.zip %srcpaths%

REM print a log message to indicate when compression is done
echo Finished at %time%

REM END script section ==========================================
