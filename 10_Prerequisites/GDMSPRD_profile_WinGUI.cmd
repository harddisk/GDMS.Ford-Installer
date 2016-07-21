::
:: GDMSPRD profile generator for PuTTY version 1.0
:: Copyright (c) 2013 by Cw Tham (harddisk@gmail.com)
::
:: Must be executed with Administrator privileges
::
:: Windows 2000, XP, 2003 specific
::
set /p "=, Win GUI"<nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Font" /t REG_SZ /d "Courier New" /f >nul
echo . . . Done!