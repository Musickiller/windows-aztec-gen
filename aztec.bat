@ECHO off
SET LOG=0

REM Current console dir is %cd%
REM Currnet file name is %0
REM Current file dir is %~dp0
SET dir=%~dp0
set imgname=aztec_code.png
set img=%dir%aztec\%imgname%


IF EXIST %img% (
	ECHO Deleting old picture...
	DEL %dir%%img%
	)

ECHO Loading python script...
python %DIR%aztec\main.py %1
ECHO Script finished.
IF EXIST %img% (
	echo Opening the image...
	ECHO %img%
	%img%
	ECHO DONE!
) else (
	echo ERROR! Image is not there!
	echo I have no checks for that but Python module "PIL", pillow has to be installed
	echo See previous errors for clarification!
	ECHO ------------------------
)

