@echo off

REM    PCGamess.bat

REM    Waits until running GamessFirefly jobs are finished, 
REM    then runs Firefly with next input file, writes output file into 
REM    input_filename.out, and logs calculation in log.txt.

REM  - Installation:
REM    Place this batch file into your folder containing the Firefly executable. 
REM    Set Scratch to a location for temporary files
SET Scratch=C:\scratch
REM    Check (update) your Firefly.exe filename
SET FireflyExe=Firefly.exe

REM -  How to use:
REM    Drag and drop your input files onto this batch file or a shortcut.
REM    Jobs will be processed in random order.
REM    To recover from a stopped job, run PCGamess.bat without input.

REM    --- Path of your batch file and the Firefly executable ---
SET PCGamessPath=%~dp0

REM    --- If no input file parameter (%1) is given, clear the queue ---
if %1.==. goto shutdown

REM    --- check if Firefly is busy in file PATH_TO_PCGAMESS\PCGQUEUE.TXT ---
:check
FIND "running" %PCGamessPath%\PCGqueue.txt > nul
if errorlevel=1 goto run

REM    --- wait 10x1 seconds and then check again if busy ---
REM    (use TCP/IP ping for delay -- it was the only way in the last century) 
@echo off
set loop=
:loop
cls
echo %1: 
echo Check if PCGamess is busy
set loop=.%loop%
echo %loop%
@ping 127.0.0.1 -n 2 -w 1000 > nul
@ping 127.0.0.1 -n %1% -w 1000> nul
if not "%loop%"==".........." goto loop
goto check

REM    --- run Firefly now ---
:run
echo running 
echo %1
echo running> %PCGamessPath%PCGqueue.txt
%PCGamessPath%\%FireflyExe% -legacy -r -f -p -t %Scratch% -i %1 -o %1.out
REM --- use custom basis with -b %PCGamessPath%BASIS.lib ---
REM --- I use the -legacy option to create wxmacmolplt readable output files ---

REM --- Shutdown after run is complete, log run in log.txt ---
:shutdown
echo finished %1 >> %PCGamessPath%\log.txt
echo waiting> %PCGamessPath%\PCGqueue.txt

REM --- Keep the PUNCH file by uncommenting line below ---
REM copy %~dp1PUNCH %1.punch


