@echo off

echo Starting installer for version 1.0.0

set log=0
set helpfile=usage.txt

if %log% GEQ 3 echo settings set

:: set dir=%homedrive%%homepath%\apps\
:: there is a better way:
set dir=%userprofile%\apps\
set installator_dir=%~dp0

if %log% GEQ 2 echo dirs set

:: /I = case insensitive comparison
:: don't put comments before closing ")"
if /I "%1" EQU "-h" (
	if %log% GEQ 3 echo first condition
	call :Help
	exit /b
)
if /I "%1" EQU "-u" (
	if %log% GEQ 3 echo second coindition
	call :Uninstall
	exit /b
) else (
if %log% GEQ 3 echo third coindition
call :Install
:: force execution to quit at the end of the "main" logic
:: /b is to end this bath file, not the console
EXIT /b 0
)

:ChooseDir
echo Enter installation location.
:: echo It should be in your PATH
echo Enter "x" to exit.
set /p dir="(default location is C:%homepath%\apps\, hit Enter to use it): "
EXIT /B 0

:Help
type %helpfile%
:: cat-like thing for winfows.
EXIT /B 0

:Install
call :ChooseDir
IF /I "%dir%" NEQ "x" call :Copy
::call :End
EXIT /B 0

:Uninstall
call :ChooseDir
IF /I "%dir%" NEQ "x" call :Clean
::call :End
EXIT /B 0

:Copy
echo Chosen location is "%dir%"
xcopy %installator_dir%aztec.bat %dir%
xcopy /f %installator_dir%aztec\main.py %dir%aztec\
xcopy /f %installator_dir%aztec\aztec_code_generator\aztec_code_generator.py %dir%aztec\aztec_code_generator\
EXIT /B 0

:Clean
:: /a to mark variable as a number
:: && take action on success
:: || take action on failure
:: but del is a success even if files are not found
@echo on
DEL %dir%aztec.bat
DEL %dir%aztec\main.py
DEL %dir%aztec\aztec_code_generator\aztec_code_generator.py
RMDIR %dir%aztec\aztec_code_generator
RMDIR %dir%aztec
RMDIR %dir%
@echo off
:: so I just let user know stuff this way
echo Should have deleted all files. Look at errors if there are any.
EXIT /B 0

:::End
::echo "Exiting now"
