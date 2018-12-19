@echo off

set installation_dir=C:%homepath%\apps\
set installator_dir=%~dp0

echo Enter installation location.
echo It should be in your PATH
set /p installation_dir="(default location is C:%homepath%, hit Enter to use): "
echo Chosen location is "%installation_dir%"

xcopy %installator_dir%aztec.bat %install_dir%
xcopy /f %installator_dir%aztec\main.py %install_dir%aztec\
xcopy /f %installator_dir%aztec\aztec_code_generator\aztec_code_generator.py %install_dir%aztec\aztec_code_generator\