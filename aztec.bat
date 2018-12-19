@ECHO off
SET LOG=0

REM Current console dir is %cd%
REM Currnet file name is %0
REM Current file dir is %~dp0
SET DIR=%~dp0

REM IF EXIST %~dp0
REM ECHO Deleting old picture...
REM DEL DIR

ECHO Loading python script...
python %DIR%aztec\main.py %1
ECHO Script finished, opening the image...
ECHO DIRaztec\aztec_code.png
%DIR%aztec\aztec_code.png
ECHO DONE!
ECHO ------------------------
