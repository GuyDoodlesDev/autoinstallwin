@echo off
echo This script will assist in installing Nomkid's most used programs.
echo This is meant to be used on a fresh Windows install.
echo.
echo Computer will make an alert sound upon completion.
echo.
choice /M "Continue?"
if errorlevel 2 goto eof
cls
echo Setting window to stay on top...
powershell -ExecutionPolicy UnRestricted -Command "(Add-Type -memberDefinition \"[DllImport(\"\"user32.dll\"\")] public static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter, int x,int y,int cx, int xy, uint flagsw);\" -name \"Win32SetWindowPos\" -passThru )::SetWindowPos((Add-Type -memberDefinition \"[DllImport(\"\"Kernel32.dll\"\")] public static extern IntPtr GetConsoleWindow();\" -name \"Win32GetConsoleWindow\" -passThru )::GetConsoleWindow(),-1,0,0,0,0,67)"
echo Making temp directory...
md C:\autosetuptemp
echo Copying files to temp directory for quicker running...
xcopy /Q \Installers\ C:\autosetuptemp\ /s
echo Done!
echo.
echo Installing Chromium...
start C:\autosetuptemp\chromium.exe
echo Installing Roblox...
start C:\autosetuptemp\roblox.exe
echo Starting Ninite...
start /wait C:\autosetuptemp\ninite.exe
echo Destroying temp folder...
rd /S /Q C:\autosetuptemp\
echo 
echo Chromium should be open. Right click the icon and click "Pin to taskbar".
pause
