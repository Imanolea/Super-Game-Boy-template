@echo off

set gamename=SGB development

if exist "rom/%gamename%.gb" del "rom/%gamename%.gb"

:begin
set assemble=1
echo assembling...
rgbasm -o%1.obj dev/%1.asm
if errorlevel 1 goto end
echo linking...
rgblink -o"rom/%gamename%.gb" %1.obj
if errorlevel 1 goto end
echo fixing...
rgbfix -p0 -v "rom/%gamename%.gb"
del %1.obj

:end
