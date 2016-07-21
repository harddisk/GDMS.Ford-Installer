@echo off
cls
setlocal EnableDelayedExpansion
echo.Defining variables . . .
set getvalue="Cisco AnyConnect Secure Mobility Client"
set getvaluename=NetCfgInstanceId
set setvaluename=RegistrationEnabled
set setvalue=0
REM /* Query every {GUID} subkey under "HLKM\SYSTEM\ControlSet001\Control\Class".
echo.Seeking registry for Cisco AnyConnect GUID
REM for /f "tokens=*" %%A in ('reg query HKLM\SYSTEM\ControlSet001\Control\Class') do (
for /f "tokens=*" %%A in ('reg query HKLM\SYSTEM\CurrentControlSet\Control\Class') do (
	rem setlocal EnableDelayedExpansion

	REM /* Query every subkey under each {GUID}.
	for /f "tokens=*" %%B in ('reg query %%A') do (
	    rem echo In: %%A
        rem echo Found: %%B
        reg query %%B /f "Cisco AnyConnect Secure Mobility Client" >nul 2>&1
        if !errorlevel! equ 0 (
            echo Found it in: reg query %%B
            rem reg query %%B /v %getvaluename%
            rem setlocal EnableDelayedExpansion
            for /f "tokens=1-3" %%C in ('reg query %%B /v %getvaluename% ^| findstr /i %getvaluename%') do (
                echo Found: %%C = %%E

                echo Look for "%%E" under HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Tcpip\Parameters\Interfaces\
                echo Set "RegistrationEnabled" to [0]

                reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Tcpip\Parameters\Interfaces\%%E /v %setvaluename% >nul 2>&1
                if !errorlevel! equ 0 (
                    reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Tcpip\Parameters\Interfaces\%%E /v %setvaluename% /t REG_DWORD /d %setvalue% /f >nul
                    echo done
                ) else (
                    echo failed
                )
                exit /b 0
            )
        )
	)
    rem endlocal
	rem reg query %%A%subfolder% /v %valuename% >nul 2>&1
	rem if !errorlevel! equ 0 (
	rem 	REM /* set DisableRegistryTools = 0
	rem 	reg add %%A%subfolder% /v %valuename% /t REG_DWORD /d 0 /f >nul
	rem 	echo.
	rem 	echo It happens so fast that nothing is displayed here!
	rem 	echo.
	rem 	echo Registry editing enabled!
	rem )
)