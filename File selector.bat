@echo off
:1
set num=0
set n1=0
set hi=0
set /a l= 1+1
cls
set /p input1= enter the number of files you want: 
set /p address= enter the address of your files:
set /a input1=%input1%+1
md filename
md SelectedFiles
FOR /f "tokens=1*delims=:" %%b IN ('dir /b /a-d "%address%\*" ^|findstr /n /V ":"') DO (ECHO/file: %%~fc)> filename\filename%%b.txt
FOR /f "tokens=1*delims=:" %%b IN ('dir /b /a-d "%address%\*" ^|findstr /n /V ":"') DO if %l%==2 set total=%%b

:3
echo.This program was created by Quiet Coder> SelectedFiles\text.txt
FOR /f "tokens=1*delims=:" %%b IN ('dir /b /a-d "%address%\SelectedFiles\*" ^|findstr /n /V ":"') DO if %l%==2 set last=%%b
timeout 1
:2
set /a n=%random% %% %total% +1

FOR /f "tokens=1*delims=:" %%b IN ('dir /b /a-d "%address%\SelectedFiles\*" ^|findstr /n /V ":"') DO if %l%==2 set new=%%b

if %new% GTR %last% (
set last=%new% 
set /a num=%num%+1)

if %hi%==0 (if %new%==%last% last=%new%
set /a num=%num%+1
set /a hi= 1+1
)

for /f "tokens=1* delims=file:" %%a in (filename\filename%n%.txt) do if %l%==2 set file=%%b

copy "%file%" "SelectedFiles"


if %num% lss %input1% goto 2
echo your files have been copied

pause
goto 1