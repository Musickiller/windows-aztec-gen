@echo off

set dir=C:%homepath%\apps\
set installator_dir=%~dp0

echo Enter installation location.
echo It should be in your PATH
set /p dir="(default location is C:%homepath%, hit Enter to use it): "
echo Chosen location is "%dir%"

xcopy %installator_dir%aztec.bat %dir%
xcopy /f %installator_dir%aztec\main.py %dir%aztec\
xcopy /f %installator_dir%aztec\aztec_code_generator\aztec_code_generator.py %dir%aztec\aztec_code_generator\