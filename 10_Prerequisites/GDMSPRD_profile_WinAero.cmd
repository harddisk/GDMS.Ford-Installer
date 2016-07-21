::
:: GDMSPRD profile generator for PuTTY version 1.0
:: Copyright (c) 2013 by Cw Tham (harddisk@gmail.com)
::
:: Must be executed with Administrator privileges
::
:: Windows Vista, 7 specific
::
set /p "=, Win AeroUI"<nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Font" /t REG_SZ /d "Consolas" /f >nul
echo . . . Done!