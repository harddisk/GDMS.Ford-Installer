@echo off
set subfolder=\Software\Microsoft\Windows\CurrentVersion\Policies\System
set valuename=DisableRegistryTools
:: Seek and destroy [DisableRegistryTools] entry. Set to [0].
for /f "tokens=*" %%A in ('reg query HKU ^|findstr /i /v ".DEFAULT"^|findstr /i /v "Classes"') do (
	setlocal EnableDelayedExpansion
	:: find value [DisableRegistryTools]
	reg query %%A%subfolder% /v %valuename% >nul 2>&1
	if !errorlevel! equ 0 (
		:: set DisableRegistryTools = 0
		reg add %%A%subfolder% /v %valuename% /t REG_DWORD /d 1 /f >nul
		echo.
		echo It happens so fast that nothing is displayed here!
		echo.
		echo Registry editing disabled!
	)
)