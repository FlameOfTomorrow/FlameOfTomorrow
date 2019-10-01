cd %~dp0

copy FE8_clean.gba _Hack.gba

cd "%~dp0Event Assembler"

Core A FE8 "-output:%~dp0_Hack.gba" "-input:%~dp0ROM Buildfile.event"

if exist "%~dp0ups/ups.exe" (
    cd "%~dp0ups"
    ups diff -b "%~dp0FE8_clean.gba" -m "%~dp0_Hack.gba" -o "%~dp0_Hack.ups"
)

pause
