@ECHO OFF
TITLE Wallpaper Setter Utility
COLOR 0A

:MAIN
ECHO **Wallpaper Setter Utility**
ECHO.
ECHO Press 1 to enter URL.
ECHO Press 2 to enter File Path.
CHOICE /C 12 /CS /N /M ""
IF %ERRORLEVEL%==1 GOTO URL
IF %ERRORLEVEL%==2 GOTO FILE_PATH
GOTO MAIN

:URL
SET /P IMG_URL=Enter Image URL: 
SET IMG_PATH=%TEMP%\wallpaper.jpg
powershell -Command "Invoke-WebRequest -Uri '%IMG_URL%' -OutFile '%IMG_PATH%'"
GOTO SET_WALLPAPER

:FILE_PATH
SET /P IMG_PATH=Enter Image Path Address: 
GOTO SET_WALLPAPER


:SET_WALLPAPER
powershell -Command "Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name Wallpaper -Value '%IMG_PATH%'; Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\")] public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20, 0, '%IMG_PATH%', 3)"
