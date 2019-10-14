cd %~dp0

@echo off

copy FE8_clean.gba _Hack.gba

cd "%~dp0Text"

echo: | (text-process-classic text_buildfile.txt --parser-exe "%~dp0Event Assembler/Tools/ParseFile.exe")

cd "%~dp0Tables"

echo: | (c2eanopfinder "%~dp0FE8_clean.gba")

cd "%~dp0Maps"

echo: | (tmx2ea -s)

if not exist "%~dp0_Hack.sym" (

Core A FE8 "-output:%~dp0_Hack.gba" "-input:%~dp0ROM Buildfile.event" --nocash-sym

cd "%~dp0Tools"

AppendFile "%~dp0_Hack.sym" "%~dp0FE8_clean.sym"

)

if exist "%~dp0_Hack.sym" (

cd "%~dp0Event Assembler"

Core A FE8 "-output:%~dp0_Hack.gba" "-input:%~dp0ROM Buildfile.event"

)

cd "%~dp0Tools"

AppendFile "%~dp0_Hack.sym" "%~dp0FE8_clean.sym"

if exist "%~dp0ups/ups.exe" (
    cd "%~dp0ups"
    ups diff -b "%~dp0FE8_clean.gba" -m "%~dp0_Hack.gba" -o "%~dp0_Hack.ups"
)

pause
