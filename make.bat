@echo off

SET ORICUTRON="..\..\..\oricutron\"
set PATH_VID="usr\share\presto"
SET ORIGIN_PATH=%CD%

set VERSION="0.0.1"


rem %OSDK%\bin\xa.exe src\vidplay.asm -o release/orix/bin/vidplay -DTARGET_ORIX
%OSDK%\bin\xa.exe src\presto.asm -o release/orix/usr/bin/prestoc -DTARGET_ORIX

IF "%1"=="NORUN" GOTO End
rem mkdir %ORICUTRON%\usbdrive\%PATH_VID%\

copy  release\orix\%PATH_VID%\presto.vhi   %ORICUTRON%\usbdrive\%PATH_VID%\
copy  release\orix\%PATH_VID%\prestoc.vhi   %ORICUTRON%\usbdrive\%PATH_VID%\
copy  release\orix\usr\bin\prestoc %ORICUTRON%\usbdrive\usr\bin
copy  release\orix\usr\bin\presto %ORICUTRON%\usbdrive\usr\bin

cd %ORICUTRON%
OricutronV4 -mt
cd %ORIGIN_PATH%
:End


