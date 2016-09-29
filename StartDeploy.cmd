@echo off
REM /*
REM /* GDMS Deployment batch script version 1.6
REM /* Copyright (c) 2013 by Cw Tham (cw.tham@hyundai.com.my)
REM /*
REM /* 2016-02-03: update file just for Git update to test AutoCRLF
REM /*
setlocal enableextensions enabledelayedexpansion
set debug=0
goto :menu

REM /* preparing variables - run once
:prep_var
title Preparing variables . . .
REM /* prepare in silence
for /f %%a in ('copy /Z "%~dpf0" nul') do set "ASCII_13=%%a"
for /f %%A in ('"prompt $H&for %%B in (1) do rem"') do set "BS=%%A"
set NLM=^


set NL=^^^%NLM%%NLM%^%NLM%%NLM%
REM /* set WebClient default to FC Live
IF "%webc%" EQU "" (
    set webc=FD
    set wclive=fdlive.prowcapc
    set wctrain=fdtrain.prowcapc
    set vpnuser=hd_preferences.xml
    set vpnglob=hd_preferences_global.xml
)
exit /b 0

REM /* subroutine: display home folder s
:checkHome
REM /* make sure home folder is valid, otherwise variables would cause problem
echo # Home folder    : "%~dp0"
pushd "%~dp0" >nul 2>&1
IF "%ERRORLEVEL%" EQU "1" (
	echo     ========================================================================
	echo     ^|    Unable to return to home folder. Please ensure folder does not    ^|
	echo     ^| does not contain symbols. Only alphanumeric characters are accepted. ^|
	echo     ^|                                                                      ^|
	echo     ^|                       Press [Enter] to close.                        ^|
	echo     ========================================================================
	pause >nul
)
exit /b %ERRORLEVEL%

REM /* subroutine: display Windows version
:checkVersion
<nul set /p "=%BS%# Checking Windows version . . ."
REM /* Check Windows Version
ver | findstr /i "5\.0\." >nul
IF %ERRORLEVEL% EQU 0 (set osv=Win2k&& set cmdv=1&& set atype=1)
ver | findstr /i "5\.1\." >nul
IF %ERRORLEVEL% EQU 0 (set osv=WinXP&& set cmdv=1&& set atype=1)
ver | findstr /i "5\.2\." >nul
IF %ERRORLEVEL% EQU 0 (set osv=Win2k3&& set cmdv=1&& set atype=1)
ver | findstr /i "6\.0\." >nul
IF %ERRORLEVEL% EQU 0 (set osv=Vista&& set cmdv=2&& set atype=2)
ver | findstr /i "6\.1\." >nul
IF %ERRORLEVEL% EQU 0 (set osv=Win7&& set cmdv=2&& set atype=2)
ver | findstr /i "6\.2\." >nul
IF %ERRORLEVEL% EQU 0 (set osv=Win8&& set cmdv=2&& set atype=1)
ver | findstr /i "6\.3\." >nul
IF %ERRORLEVEL% EQU 0 (set osv=Win8&& set cmdv=2&& set atype=1)
ver | findstr /i "10\.0\." >nul
IF %ERRORLEVEL% EQU 0 (set osv=Win10&& set cmdv=2&& set atype=1)
REM /* clear previous line
<nul set /p "=%BS%!ASCII_13!                                                                        "
<nul set /p "=%BS%!ASCII_13!# Windows version: "
ver | find /i "version"
exit /b 0

REM /* subroutine:
:checkArchitecture
<nul set /p "=%BS%# Checking Processor Architecture . . ."
REM /* Detects processor architecture -- x86/x64
IF Defined ProgramFiles(x86) (
	REM /* x64
	set arch=x64
) ELSE (
	REM /* x86
	set arch=x86
)
REM /* clear previous line
<nul set /p "=%BS%!ASCII_13!                                                                        "
echo !ASCII_13!# Processor arch.: %arch%
exit /b 0

:checkPrivilege
<nul set /p "=%BS%# Checking Administrator Privileges . . ."
set IsAdmin=0
REM /* Type 1: Windows 2000, XP, 2003, Win8 privilege checks
IF "%atype%" EQU "1" (
	REM /* Windows 2000, XP, 2003 command prompt scripting
	net session >nul 2>&1
	IF "%ERRORLEVEL%" EQU "0" (
		set IsAdmin=1
	) ELSE (
		echo.
		echo     ========================================================================
		echo     ^|           Requires Administrator privileges to install.              ^|
		echo     ^|                                                                      ^|
		echo     ^|           1^) Try 'runas' command or login as Administrator.          ^|
		echo     ^|           2^) or right-click -^> Run as administrator.                 ^|
		echo     ^|                                                                      ^|
		echo     ^|                       Press [Enter] to close.                        ^|
		echo     ========================================================================
		echo.
		pause >nul
		exit /b 1
	)
)
REM /* Type 2: Windows Vista, Win7 privilege checks
IF "%atype%" EQU "2" (
	REM /* Windows Vista, 7 command prompt scripting
	whoami /groups | findstr /b /c:"Mandatory Label\High Mandatory Level" | findstr /c:"Enabled group" >nul: && set IsAdmin=1
	IF "!IsAdmin!" EQU "0" (
		echo.
		echo     ========================================================================
		echo     ^|             Requires Administrator privileges to install.            ^|
		echo     ^|                                                                      ^|
		echo     ^|           You may try right-click -^> Run as administrator.           ^|
		echo     ^|                                                                      ^|
		echo     ^|                       Press [Enter] to close.                        ^|
		echo     ========================================================================
		pause >nul
		exit /b 1
	)
)
REM /* clear previous line
<nul set /p "=%BS%!ASCII_13!                                                                        "
echo !ASCII_13!# Admin privilege: OK
exit /b 0

:prep_var_2
REM /* 2nd stage of variables preparation
IF "%cmdv%" EQU "1" (
	REM /* Windows 2000, XP, 2003
	set startup=%ALLUSERSPROFILE%\Start Menu\Programs\Startup
	set desktop=%ALLUSERSPROFILE%\Desktop
	set gdms=%ALLUSERSPROFILE%\Desktop\GDMS
	set appdatauser=%USERPROFILE%\Local Settings\Application Data
	set appdataall=%ALLUSERSPROFILE%\Application Data
	set startmenu=%ALLUSERSPROFILE%\Start Menu\Programs
)
IF "%cmdv%" EQU "2" (
	REM /* Windows Vista, 7, 8, 8.1, 10
	set startup=%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Startup
	set desktop=%PUBLIC%\Desktop
	set gdms=%PUBLIC%\Desktop\GDMS
	set appdatauser=%LOCALAPPDATA%
	set appdataall=%ALLUSERSPROFILE%\
	set startmenu=%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs
)
REM /* All GDMS related applications are 32-bit, hence
REM /* define to x86 Program Files folder 
IF "%arch%" EQU "x86" (
	set progfiles=%ProgramFiles%
	set regkey=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
	set wc9iss=%~dp010_Prerequisites\WC9_x86.iss
	set wc10iss=%~dp010_Prerequisites\WC10_x86.iss
)
IF "%arch%" EQU "x64" (
	set progfiles=!ProgramFiles^(x86^)!
	set regkey=HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run
	set wc9iss=%~dp010_Prerequisites\WC9_x64.iss
	set wc10iss=%~dp010_Prerequisites\WC10_x64.iss
)
IF NOT EXIST "%gdms%" (md "%gdms%")
exit /b 0

:list_variables
REM /* unremark these for variables debugging
echo  ====================
echo  ^|    Debug Info    ^|
echo  ====================
echo    StartUp          : %StartUp%
echo    Desktop          : %Desktop%
echo    GDMS             : %GDMS%
echo    AppDataUser      : %AppDataUser%
echo    AppDataAll       : %AppDataAll%
echo    StartMenu        : %StartMenu%
echo    Program Files    : %ProgFiles%
echo    VPN user config  : %VPNUser%
echo    VPN Global config: %VPNGlob%
echo    FTP autorun key  : %RegKey%
echo    WC9 Script       : %WC9ISS%
echo    WC10 Script      : %WC10ISS%
echo    WC Live Prowcapc : %WCLive%
echo    WC Train Prowcapc: %WCTrain%
echo  ====================
echo  ^|     End Info     ^|
echo  ====================
echo.
goto :eof

:menu
title Performing Preliminary Checks . . .
call :prep_var || goto :end
call :checkHome || goto :end
call :checkVersion || goto :end
call :checkArchitecture || goto :end
call :checkPrivilege || goto :end
call :prep_var_2 || goto :end
REM /* display debugging info
IF "%debug%" EQU "1" call :list_variables
REM /* reset menu flag to avoid executing last selection
REM /* when pressing [Enter] without input
set menu=
REM /* reset error flag
set errflag=0
REM /* call check modules before displaying menu each time
call :checkModule 1
call :checkModule 2
call :checkModule 3
call :checkModule 4
call :checkModule 5
call :checkModule 6
call :checkModule 7
call :checkModule 8
title OS: [%osv%], Architecture: [%arch%] Main menu
REM /* Installation menu (shared)
echo.
echo  ==============================================================================
echo  ^|      GDMS Deployment menu                                                  ^|
echo  ==============================================================================
echo.
echo         [1^|a] - VPN client                                     ... [%i1stat%]
echo         [2^|b] - FTP server                                     ... [%i2stat%]
echo         [3^|c] - PuTTY                                          ... [%i3stat%]
echo         [4^|d] - Crystal Report                                 ... [%i4stat%]
echo         [5^|e] - Web Client v9                                  ... [%i5stat%]
echo         [6^|f] - Web Client v10                                 ... [%i6stat%]
echo         [7^|g] - %webc% Live/Train (requires Web Client v9) [s]     ... [%i7stat%]
echo         [8^|h] - Print Service (requires Web Client v10)        ... [%i8stat%]
echo.
echo           [x] - Exit
echo.
echo         [1-8] - install specified item and the rest of item(s).
echo         [a-h] - install ONLY single item.
echo           [s] - switch between FD Live/Train or FC Live/Train
echo.
set /p menu="# Please enter your choice: "
IF /i "%menu%" EQU "1" (set SINGLE_INSTALL=0&& goto 01_VPN)
IF /i "%menu%" EQU "a" (set SINGLE_INSTALL=1&& goto 01_VPN)
IF /i "%menu%" EQU "2" (set SINGLE_INSTALL=0&& goto 02_FTP)
IF /i "%menu%" EQU "b" (set SINGLE_INSTALL=1&& goto 02_FTP)
IF /i "%menu%" EQU "3" (set SINGLE_INSTALL=0&& goto 03_PUT)
IF /i "%menu%" EQU "c" (set SINGLE_INSTALL=1&& goto 03_PUT)
IF /i "%menu%" EQU "4" (set SINGLE_INSTALL=0&& goto 04_CRV)
IF /i "%menu%" EQU "d" (set SINGLE_INSTALL=1&& goto 04_CRV)
IF /i "%menu%" EQU "5" (set SINGLE_INSTALL=0&& goto 05_WC9)
IF /i "%menu%" EQU "e" (set SINGLE_INSTALL=1&& goto 05_WC9)
IF /i "%menu%" EQU "6" (set SINGLE_INSTALL=0&& goto 06_WC10)
IF /i "%menu%" EQU "f" (set SINGLE_INSTALL=1&& goto 06_WC10)
IF /i "%menu%" EQU "7" (set SINGLE_INSTALL=0&& goto 07_WCA)
IF /i "%menu%" EQU "g" (set SINGLE_INSTALL=1&& goto 07_WCA)
IF /i "%menu%" EQU "8" (set SINGLE_INSTALL=0&& goto 08_PRS)
IF /i "%menu%" EQU "h" (set SINGLE_INSTALL=1&& goto 08_PRS)
IF /i "%menu%" EQU "s" (
	IF /i "%webc%" EQU "FD" (
		set webc=FC
		set vpnuser=ht_preferences.xml
		set vpnglob=ht_preferences_global.xml
		set wclive=fclive.prowcapc
		set wctrain=fctrain.prowcapc
	)
	IF /i "%webc%" EQU "FC" (
		set webc=FD
		set vpnuser=hd_preferences.xml
		set vpnglob=hd_preferences_global.xml
		set wclive=fdlive.prowcapc
		set wctrain=fdtrain.prowcapc
	)
	echo.
	echo                    ==========================================
	echo                    ^|            Switched to [!webc!]            ^|
	echo                    ==========================================
	echo.
	call :halt 2
	goto menu
)
IF /i "%menu%" EQU "x" (goto end)
IF /i "%menu%" EQU "z" (
	REM /* hidden menu, show all missing files
	IF "%i1stat%%i2stat%%i3stat%%i4stat%%i5stat%%i6stat%%i7stat%%i8stat%" EQU "OKOKOKOKOKOKOKOK" (
		echo.
		echo               ====================================================
		echo               ^|     Prerequisites files verification passed^^!     ^|
		echo               ====================================================
		echo.
		call :halt 3
	) ELSE (
		echo.
		call :printLine
		echo    Missing files:
		IF "%i1stat%" NEQ "OK" (echo %i1mesg%)
		IF "%i2stat%" NEQ "OK" (echo %i2mesg%)
		IF "%i3stat%" NEQ "OK" (echo %i3mesg%)
		IF "%i4stat%" NEQ "OK" (echo %i4mesg%)
		IF "%i5stat%" NEQ "OK" (echo %i5mesg%)
		IF "%i6stat%" NEQ "OK" (echo %i6mesg%)
		IF "%i7stat%" NEQ "OK" (echo %i7mesg%)
		IF "%i8stat%" NEQ "OK" (echo %i8mesg%)
		call :printLine
		echo.
		echo Press [Enter] to continue . . .
		pause >nul
	)
	goto menu
)
REM /* when no valid selection is made
echo.
echo                    ==========================================
echo                    ^|           Invalid choice.              ^|
echo                    ==========================================
echo.
call :halt 2
goto menu

:01_VPN
title [%osv%] [%arch%] Installing VPN client . . .
REM /* proceed if files all check out OK
IF "%i1stat%" EQU "OK" (
	pushd 01_VPN
	echo     ========================================================================
	echo     ^|    01 VPN client setup . . .                                         ^|
	echo     ^|======================================================================^|
	REM /* detect IF application already installed -- find program file
	REM /*   \Cisco\Cisco AnyConnect Secure Mobility Client\vpnui.exe
	echo     ^|       ^> Scanning existing installation . . .                         ^|
	IF NOT EXIST "%ProgFiles%\Cisco\Cisco AnyConnect Secure Mobility Client\vpnui.exe" (
		echo     ^|         + No existing installation found.                            ^|
		REM /* determine if WinXP SP3 has been installed.
		IF "%osv%" EQU "WinXP" (
			pushd ..\11_Big_Files
			echo     ^|                                                                      ^|
			echo     ^|       ^> Checking for Windows validity ^(Service Pack 3^) . . .         ^|
			reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CSDversion|Find "Service Pack 3">nul 2>&1&&(
				echo     ^|         + Operating System fulfilled requirements.                   ^|
			) || (
				echo     ^|         x Windows XP Service Pack 3 not installed.                   ^|
				echo     ^|         - Press [Enter] to proceed with installation.                ^|
				echo     ^|           ^(this will take a long while.^)                             ^|
				pause >nul
				IF EXIST "WindowsXP-KB936929-SP3-x86-ENU.exe" (
					REM /* use normal install to show progress
					echo     ^|         ^> Installing "WindowsXP-KB936929-SP3-x86-ENU.exe"            ^|
					call "WindowsXP-KB936929-SP3-x86-ENU.exe"
					IF "%ERRORLEVEL%" EQU "0" (
						echo     ^|           + Completed.                                               ^|
					) ELSE (
						echo     ^|           x Completed with error.                                    ^|
					)
				) ELSE (
					REM /* skip when file not found
					echo     ^|         x Skipped installation, file not found.                      ^|
				)
			)
			popd
		)
		echo     ^|                                                                      ^|
		echo     ^|       ^> Installing "anyconnect-win-3.1.04059-web-deploy-k9.exe"      ^|
		call "anyconnect-win-3.1.04059-web-deploy-k9.exe" /qn
		IF "%ERRORLEVEL%" EQU "0" (
			pushd ..\10_Prerequisites
			echo     ^|         + Completed.                                                 ^|
			echo     ^|         + Configuring Cisco AnyConnect client ^(global^) . . .         ^|
			copy /v /y %vpnglob% "%AppDataAll%\Cisco\Cisco AnyConnect Secure Mobility Client\preferences_global.xml" >nul 2>&1
			echo     ^|         + Configuring Cisco AnyConnect client ^(user^) . . .           ^|
			copy /v /y %vpnuser% "%AppDataUser%\Cisco\Cisco AnyConnect Secure Mobility Client\preferences.xml" >nul 2>&1
			echo     ^|         + Creating shortcut file . . .                               ^|
			copy /v /y "%StartMenu%\Cisco\Cisco AnyConnect Secure Mobility Client\Cisco AnyConnect Secure Mobility Client.lnk" "%gdms%" >nul 2>&1
            echo     ^|                                                                      ^|
            echo     ^|       ^> Fixing DNS issue on Cisco AnyConnect Network Interface . . . ^|
			FOR /f "tokens=*" %%A IN ('reg query HKLM\SYSTEM\CurrentControlSet\Control\Class') DO (
            	FOR /f "tokens=*" %%B IN ('reg query %%A') DO (
                    reg query %%B /f "Cisco AnyConnect Secure Mobility Client" >nul 2>&1
                    IF "!errorlevel!" EQU "0" (
                        FOR /f "tokens=1-3" %%C IN ('reg query %%B /v NetCfgInstanceId ^| findstr /i NetCfgInstanceId') DO (
                            reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Tcpip\Parameters\Interfaces\%%E /v RegistrationEnabled >nul 2>&1
                            IF "!errorlevel!" EQU "0" (
                                reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Tcpip\Parameters\Interfaces\%%E /v RegistrationEnabled /t REG_DWORD /d 0 /f >nul
                                echo     ^|         + Done.                                                      ^|
                            ) else (
                                echo     ^|         x Failed.                                                    ^|
                            )
                        )
                    )
            	)
            )
			echo     ^|                                                                      ^|
			echo     ^|       VPN client installed and configured.                           ^|
			echo     ========================================================================
			popd
		) ELSE (
			REM /* unknown error, installation aborted by installer
			SET errflag=1
			echo     ^|         x Error occurred during installation.                        ^|
			set SINGLE_INSTALL==1
		)
	) ELSE (
		REM /* skip installation
		set errflag=1
		echo     ^|         x VPN client already installed. Skipping installation.       ^|
		echo     ^|         - To proceed with installation, please uninstall first.      ^|
	)
	if "!errflag!" EQU "1" (
		echo     ^|                                                                      ^|
		echo     ^|       VPN client installation aborted.                               ^|
		echo     ========================================================================
	)
	popd
) ELSE (
	echo.
	call :printLine
	echo    Missing files for VPN setup:
	echo %i1mesg%
	call :printLine
	echo.
	call :halt 2
	set SINGLE_INSTALL=1
)
echo.
IF "%SINGLE_INSTALL%" EQU "1" (
    set SINGLE_INSTALL=
    call :halt 3
    goto menu
)
REM /* VPN - end

:02_FTP
title [%osv%] [%arch%] Installing FTP server . . .
REM /* proceed if files all check out OK
IF "%i2stat%" EQU "OK" (
	pushd 02_FTP
	echo     ========================================================================
	echo     ^|    02 FTP server setup . . .                                         ^|
	echo     ^|======================================================================^|
	REM /* detect IF application already installed -- find program file
	REM /*   \FileZilla Server\FileZilla Server.exe
	echo     ^|       ^> Scanning existing installation . . .                         ^|
	IF NOT EXIST "%ProgFiles%\FileZilla Server\FileZilla Server.exe" (
		echo     ^|         + No existing installation found.                            ^|
		echo     ^|                                                                      ^|
		echo     ^|       ^> Installing "FileZilla_Server-0_9_42.exe"                     ^|
		REM /* last version of FileZilla Server that supports Windows XP under Service Mode
		call "FileZilla_Server-0_9_42.exe" /S
		IF "%ERRORLEVEL%" EQU "0" (
			echo     ^|         + Completed.                                                 ^|
		) ELSE (
			echo     ^|         x Completed with error.                                      ^|
		)
		taskkill /f /im "FileZilla Server Interface.exe" >nul 2>&1
		pushd ..\10_Prerequisites
		echo     ^|         + Updating FileZilla configuration . . .                     ^|
		copy /v /y "FileZilla Server.xml" "%ProgFiles%\FileZilla Server\" >nul 2>&1
		REM /* determine whether FileZilla Server.exe could be found, before doing /reload-config
		IF EXIST "%ProgFiles%\FileZilla Server\FileZilla Server.exe" (
			call "%ProgFiles%\FileZilla Server\FileZilla Server.exe" /reload-config
			echo     ^|           - Done.                                                    ^|
		) ELSE (
			echo     ^|           x Failed.                                                  ^|
		)
		popd
		echo     ^|         + Removing autorun registry entry . . .                      ^|
		reg delete "%regkey%" /v "FileZilla Server Interface" /f >nul 2>&1
		echo     ^|         + Creating 'ftproot' and 'tmp' folders . . .                 ^|
		md C:\ftproot >nul 2>&1
		md C:\tmp >nul 2>&1
		echo     ^|         + Creating shortcut file . . .                               ^|
		pushd ..\10_Prerequisites
		copy /v /y "[ftproot] @ C.lnk" "%gdms%" >nul 2>&1
		copy /v /y "[tmp] @ C.lnk" "%gdms%" >nul 2>&1
		popd
		echo     ^|         + Deleting Desktop shortcut file . . .                       ^|
		del "%desktop%\FileZilla Server Interface.lnk" >nul 2>&1
		IF "%cmdv%" EQU "1" (
			REM /* Windows 2000, XP, 2003
			echo     ^|         + Fixing files and folders permissions . . .                 ^|
			cacls "C:\ftproot" /e /g Users:f >nul 2>&1
			cacls "C:\tmp" /e /g Users:f >nul 2>&1
			cacls "%gdms%\[ftproot] @ C.lnk" /e /g Users:f >nul 2>&1
			cacls "%gdms%\[tmp] @ C.lnk" /e /g Users:f >nul 2>&1
			echo     ^|         + Adding Firewall Rule for FileZilla . . .                   ^|
			REM netsh advfirewall firewall add rule name="FTP Server port 21" dir=in action=allow protocol=TCP localport=21 >nul 2>&1
			REM /* Delete rule first to avoid duplicated entries
			netsh firewall delete allowedprogram "%ProgFiles%\FileZilla Server\FileZilla Server.exe" >nul 2>&1
			netsh firewall add allowedprogram "%ProgFiles%\FileZilla Server\FileZilla Server.exe" "FileZilla FTP Server" ENABLE >nul 2>&1
		)
		IF "%cmdv%" EQU "2" (
			REM /* Windows Vista, 7, 8, 8.1, 10
			echo     ^|         + Fixing files and folders permissions . . .                 ^|
			icacls "C:\ftproot" /grant Users:^(NP^) >nul 2>&1
			icacls "C:\ftproot" /grant Users:F >nul 2>&1
			icacls "C:\tmp" /grant Users:^(NP^) >nul 2>&1
			icacls "C:\tmp" /grant Users:F >nul 2>&1
			icacls "%gdms%\[ftproot] @ C.lnk" /grant Users:F >nul 2>&1
			icacls "%gdms%\[tmp] @ C.lnk" /grant Users:F >nul 2>&1
			echo     ^|         + Adding Firewall Rule for FileZilla . . .                   ^|
			REM /* Delete rule first to avoid duplicated entries
			netsh advfirewall firewall delete rule name="FileZilla FTP Server %arch%" > nul 2>&1
			netsh advfirewall firewall add rule name="FileZilla FTP Server %arch%" dir=in action=allow program="%ProgFiles%\FileZilla Server\FileZilla Server.exe" enable=yes >nul 2>&1
		)
		echo     ^|                                                                      ^|
		echo     ^|       FTP server installed and configured.                           ^|
		echo     ========================================================================
	) ELSE (
		REM /* skip installation
		echo     ^|         x FTP server already installed. Skipping installation.       ^|
		echo     ^|         - To proceed with installation, please uninstall first.      ^|
		echo     ^|                                                                      ^|
		echo     ^|       FTP server installation aborted.                               ^|
		echo     ========================================================================
	)
	popd
) ELSE (
	echo.
	call :printLine
	echo    Missing files for FTP setup:
	echo %i2mesg%
	call :printLine
	echo.
	call :halt 2
	set SINGLE_INSTALL=1
)
echo.
IF "%SINGLE_INSTALL%" EQU "1" (
    set SINGLE_INSTALL=
    call :halt 2
    goto menu
)
REM /* FTP server - end


:03_PUT
title [%osv%] [%arch%] Installing PuTTY . . .
REM /* proceed if files all check out OK
IF "%i3stat%" EQU "OK" (
	pushd 03_PUT
	echo     ========================================================================
	echo     ^|    03 PuTTY telnet client setup . . .                                ^|
	echo     ^|======================================================================^|
	echo     ^|       ^> Copying PuTTY files                                          ^|
	xcopy /s /r /y putty.exe C:\PuTTY\ >nul 2>&1
	pushd ..\10_Prerequisites
	echo     ^|         + Creating shortcut file . . .                               ^|
	copy /v /y "GDMS.lnk" "%gdms%\" >nul 2>&1
	REM /* GDMS standard profile
	echo     ^|         + Creating [GDMSPRD] profile . . .                           ^|
	call "GDMSPRD_profile.cmd" >nul
	IF "%cmdv%" EQU "1" (
		REM /* Windows 2000, XP, 2003 - Courier New
		echo     ^|         + Applying Windows GUI settings . . .                        ^|
		call "GDMSPRD_profile_WinGUI.cmd" >nul
		echo     ^|         + Fixing files and folders permissions . . .                 ^|
		cacls "C:\PuTTY" /e /g Users:f >nul 2>&1
		cacls "%gdms%\GDMS.lnk" /e /g Users:f >nul 2>&1
	)
	IF "%cmdv%" EQU "2" (
		IF "%osv%" EQU "Vista" (
			REM /* Windows Vista - Courier New
			echo     ^|         + Applying Windows GUI settings . . .                        ^|
			call "GDMSPRD_profile_WinGUI.cmd" >nul
		) ELSE (
			REM /* Windows 7, 8, 8.1, 10 - Consolas
			echo     ^|         + Applying Windows Aero GUI settings . . .                   ^|
			call "GDMSPRD_profile_WinAero.cmd" >nul
		)
		echo     ^|         + Fixing files and folders permissions . . .                 ^|
		icacls "C:\PuTTY" /grant Users:^(NP^) >nul 2>&1
		icacls "C:\PuTTY" /grant Users:F >nul 2>&1
		icacls "%gdms%\GDMS.lnk" /grant Users:F >nul 2>&1
	)
	popd
	echo     ^|                                                                      ^|
	echo     ^|       PuTTY telnet client installed and configured.                  ^|
	echo     ========================================================================
	popd
) ELSE (
	echo.
	call :printLine
	echo    Missing files for PuTTY setup:
	echo %i3mesg%
	call :printLine
	echo.
	call :halt 2
	set SINGLE_INSTALL=1
)
echo.
IF "%SINGLE_INSTALL%" EQU "1" (
    set SINGLE_INSTALL=
    call :halt 2
    goto menu
)
REM /* PuTTY - end

:04_CRV
title [%osv%] [%arch%] Installing Crystal Report . . .
REM /* proceed if files all check out OK
IF "%i4stat%" EQU "OK" (
	pushd 04_CRV
	echo     ========================================================================
	echo     ^|    04 SAP Crystal Reports Runtime Engine setup . . .                 ^|
	echo     ^|======================================================================^|
	REM /* detect IF application already installed -- find program folder
	REM /*   \SAP BusinessObjects\Crystal Reports for .NET Framework 4.0\Common\Crystal Reports 2011
	echo     ^|       ^> Scanning existing installation . . .                         ^|
	IF NOT EXIST "%ProgFiles%\SAP BusinessObjects\Crystal Reports for .NET Framework 4.0\Common\Crystal Reports 2011\" (
		echo     ^|         + No existing installation found.                            ^|
		IF "%cmdv%" EQU "1" (
			echo     ^|                                                                      ^|
			echo     ^|       ^> Checking DotNET Framework v3.5 installation . . .            ^|
			IF EXIST "%windir%\Microsoft.NET\Framework\v3.5" (
				echo     ^|         + DotNET Framework v3.5 already installed.                   ^|
			) ELSE (
				echo     ^|         x DotNET Framework v3.5 not found.                           ^|
				echo     ^|         - Press [Enter] to proceed with installation.                ^|
				echo     ^|           ^(this will take a moment.^)                                 ^|
				pause >nul
				IF EXIST ..\11_Big_Files (
					pushd ..\11_Big_Files
					IF EXIST "dotnetfx35.exe" (
						echo     ^|         ^> Installing "dotnetfx35.exe"                                ^|
						call "dotnetfx35.exe"
						IF "%ERRORLEVEL%" EQU "0" (
							echo     ^|           + Completed.                                               ^|
						) ELSE (
							echo     ^|           x Completed with error.                                    ^|
						)
					) ELSE (
						REM /* skip when file not found
						echo     ^|         x Skipped installation, "dotnetfx35.exe" not found.          ^|
					)
					popd
				) ELSE (
					echo     ^|         x Skipped installation, 11_Big_Files folder not found.       ^|
				)
			)

		)
		echo     ^|                                                                      ^|
		echo     ^|       ^> Installing "CRRuntime_32bit_13_0_6.msi"                      ^|
		call "CRRuntime_32bit_13_0_6.msi" /quiet /norestart
		IF "%ERRORLEVEL%" EQU "0" (
			echo     ^|         + Completed.                                                 ^|
		) ELSE (
			echo     ^|         x Completed with error.                                      ^|
		)
		echo     ^|                                                                      ^|
		echo     ^|       SAP Crystal Reports Runtime Engine installed.                  ^|
		echo     ========================================================================
	) ELSE (
		REM /* skip installation
		echo     ^|         x Crystal Reports already installed. Skipping installation.  ^|
		echo     ^|         - To proceed with installation, please uninstall first.      ^|
		echo     ^|                                                                      ^|
		echo     ^|       Crystal Reports installation aborted.                          ^|
		echo     ========================================================================
	)
	popd
) ELSE (
	echo.
	call :printLine
	echo    Missing files for Crystal Viewer setup:
	echo %i4mesg%
	call :printLine
	echo.
	call :halt 2
	set SINGLE_INSTALL=1
)
echo.
IF "%SINGLE_INSTALL%" EQU "1" (
    set SINGLE_INSTALL=
    call :halt 2
    goto menu
)
REM /* Crystal - end

:05_WC9
title [%osv%] [%arch%] Installing Web Client v9 . . .
REM /* proceed if files all check out OK
IF "%i5stat%" EQU "OK" (
	pushd 05_WC9
	echo     ========================================================================
	echo     ^|    05 Progress Web Client v9 setup . . .                             ^|
	echo     ^|======================================================================^|
	REM /* detect IF application already installed -- find program file
	REM /*   \Progress Software\WebClient\bin\prowc.exe
	echo     ^|       ^> Scanning existing installation . . .                         ^|
	IF NOT EXIST "%ProgFiles%\Progress Software\WebClient\bin\prowc.exe" (
		echo     ^|         + No existing installation found.                            ^|
		echo     ^|                                                                      ^|
		echo     ^|       ^> Starting Web Client v9 installation . . .                    ^|
		call Setup.exe -s -f1"%wc9iss%"
		IF "%ERRORLEVEL%" EQU "0" (
			echo     ^|         + Completed.                                                 ^|
		) ELSE (
			echo     ^|         x Completed with error.                                      ^|
		)
		echo     ^|                                                                      ^|
		echo     ^|       Progress Web Client v9 installed.                              ^|
		echo     ========================================================================
	) ELSE (
		REM /* skip installation
		echo     ^|         x Web Client v9 already installed. Skipping installation.    ^|
		echo     ^|         - To proceed with installation, please uninstall first.      ^|
		echo     ^|                                                                      ^|
		echo     ^|       Web Client v9 installation aborted.                            ^|
		echo     ========================================================================
	)
	popd
) ELSE (
	echo.
	call :printLine
	echo    Missing files for WebClient v9 setup:
	echo %i5mesg%
	call :printLine
	echo.
	call :halt 2
	set SINGLE_INSTALL=1
)
echo.
IF "%SINGLE_INSTALL%" EQU "1" (
    set SINGLE_INSTALL=
    call :halt 2
    goto menu
)
REM /* WebClient9 - end

:06_WC10
title [%osv%] [%arch%] Installing Web Client v10 . . .
REM /* proceed if files all check out OK
IF "%i6stat%" EQU "OK" (
	pushd 06_WC10
	echo     ========================================================================
	echo     ^|    06 Progress OpenEdge v10 setup . . .                              ^|
	echo     ^|======================================================================^|
	REM /* detect IF application already installed -- find program file
	REM /*   \Progress Software\WebClient10\bin\prowc.exe
	echo     ^|       ^> Scanning existing installation . . .                         ^|
	IF NOT EXIST "%ProgFiles%\Progress Software\WebClient10\bin\prowc.exe" (
		echo     ^|         + No existing installation found.                            ^|
		echo     ^|                                                                      ^|
		echo     ^|       ^> Starting Open Edge v10 installation . . .                    ^|
		call setup.exe -s -f1"%wc10iss%"
		IF "%ERRORLEVEL%" EQU "0" (
			echo     ^|         + Completed.                                                 ^|
		) ELSE (
			echo     ^|         x Completed with error.                                      ^|
		)
		REM /* add firewall whitelist entry here
		IF "%cmdv%" EQU "1" (
			echo     ^|         + Adding Firewall Port 2020 Inbound Rule . . .               ^|
			REM /* Delete rule first to avoid duplicated entries
			netsh firewall delete allowedprogram "%ProgFiles%\Progress Software\WebClient10\bin\prowc.exe" >nul 2>&1
			netsh firewall add allowedprogram "%ProgFiles%\Progress Software\WebClient10\bin\prowc.exe" "GDMS PrintService" ENABLE >nul 2>&1
		)
		IF "%cmdv%" EQU "2" (
			echo     ^|         + Adding Firewall Rule for GDMS PrintService . . .           ^|
			REM /* Delete rule first to avoid duplicated entries
			netsh advfirewall firewall delete rule name="GDMS PrintService" > nul 2>&1
			netsh advfirewall firewall add rule name="GDMS PrintService" dir=in action=allow program="%ProgFiles%\Progress Software\WebClient10\bin\prowc.exe" enable=yes >nul 2>&1
		)
		echo     ^|                                                                      ^|
		echo     ^|       Progress OpenEdge v10 installed.                               ^|
		echo     ========================================================================
	) ELSE (
		REM /* skip installation
		echo     ^|         x OpenEdge v10 already installed. Skipping installation.     ^|
		echo     ^|         - To proceed with installation, please uninstall first.      ^|
		echo     ^|                                                                      ^|
		echo     ^|       OpenEdge v10 installation aborted.                             ^|
		echo     ========================================================================
	)
	popd
) ELSE (
	echo.
	call :printLine
	echo    Missing files for WebClient v10 setup:
	echo %i6mesg%
	call :printLine
	echo.
	call :halt 2
	set SINGLE_INSTALL=1
)
echo.
IF "%SINGLE_INSTALL%" EQU "1" (
    set SINGLE_INSTALL=
    call :halt 2
    goto menu
)
REM /* WebClient10 - end

:07_WCA
title [%osv%] [%arch%] Configuring %webc% WebClient module . . .
REM /* proceed if files all check out OK
IF "%i7stat%" EQU "OK" (
	pushd 07_WCA
	echo     ========================================================================
	echo     ^|    07 WebClient Live/Train applications setup . . .                  ^|
	echo     ^|======================================================================^|
	REM /* detect IF application already installed -- find program folder
	REM /*   \WebClientApps\SIME\FD/FC Live GDMS
	echo     ^|       ^> Scanning %webc% Live installation . . .                          ^|
	IF NOT EXIST "%ProgFiles%\WebClientApps\SIME\%webc% Live GDMS\" (
		echo     ^|         + No existing installation found.                            ^|
		echo     ^|                                                                      ^|
		call :checkVPN
		IF "!ERRORLEVEL!" EQU "1" (popd && goto :menu)
		echo     ^|                                                                      ^|
		echo     ^|       ^> Installing %webc% Live client application . . .                  ^|
		call "%wclive%"
		echo     ^|         - Press [Enter] after closing login dialog.                  ^|
		pause >nul
		echo     ^|         + Setting folder permissions . . .                           ^|
		IF "%cmdv%" EQU "1" (
			REM /* Windows 2000, XP, 2003
			cacls "%ProFiles%\WebClientApps\SIME\%webc% Live GDMS" /e /g Users:f >nul 2>&1
		)
		IF "%cmdv%" EQU "2" (
			REM /* Windows Vista, 7, 8, 8.1, 10
			icacls "%ProFiles%\WebClientApps\SIME\%webc% Live GDMS" /grant Users:^(NP^) >nul 2>&1
			icacls "%ProFiles%\WebClientApps\SIME\%webc% Live GDMS" /grant Users:F >nul 2>&1
		)
		echo     ^|         + Moving shortcut file . . .                                 ^|
		move /y "%desktop%\%webc% Live GDMS.lnk" "%gdms%" >nul 2>&1
		echo     ^|                                                                      ^|
		echo     ^|       WebClient Live application installed.                          ^|
		echo     ^|======================================================================^|
	) ELSE (
		REM /* skip installation
		echo     ^|         x Application found. Skipping installation.                  ^|
		echo     ^|         - To proceed with installation, please uninstall first.      ^|
		echo     ^|                                                                      ^|
		echo     ^|       WebClient Live installation aborted.                           ^|
		echo     ^|======================================================================^|
	)
	REM /* detect IF application already installed -- find program folder
	REM /*   \WebClientApps\SIME\FD/FC Train GDMS
	echo     ^|       ^> Scanning %webc% Train installation . . .                         ^|
	IF NOT EXIST "%ProgFiles%\WebClientApps\SIME\%webc% Train GDMS\" (
		echo     ^|         + No existing installation found.                            ^|
		echo     ^|                                                                      ^|
		call :checkVPN
		IF "!ERRORLEVEL!" EQU "1" (popd && goto :menu)
		echo     ^|                                                                      ^|
		echo     ^|       ^> Installing %webc% Train client application . . .                 ^|
		call "%wctrain%"
		echo     ^|         - Press [Enter] after closing login dialog.                  ^|
		pause >nul
		echo     ^|         + Setting folder permissions . . .                           ^|
		IF "%cmdv%" EQU "1" (
			REM /* Windows 2000, XP, 2003
			cacls "%ProFiles%\WebClientApps\SIME\%webc% Train GDMS" /e /g Users:f >nul 2>&1
		)
		IF "%cmdv%" EQU "2" (
			REM /* Windows Vista, 7, 8, 8.1, 10
			icacls "%ProFiles%\WebClientApps\SIME\%webc% Train GDMS" /grant Users:^(NP^) >nul 2>&1
			icacls "%ProFiles%\WebClientApps\SIME\%webc% Train GDMS" /grant Users:F >nul 2>&1
		)
		echo     ^|         + Moving shortcut file . . .                                 ^|
		move /y "%desktop%\%webc% Train GDMS.lnk" "%gdms%" >nul 2>&1
		echo     ^|                                                                      ^|
		echo     ^|       WebClient Train applications installed.                        ^|
		echo     ========================================================================
	) ELSE (
		REM /* skip installation
		echo     ^|         x Application found. Skipping installation.                  ^|
		echo     ^|         - To proceed with installation, please uninstall first.      ^|
		echo     ^|                                                                      ^|
		echo     ^|       WebClient Train installation aborted.                          ^|
		echo     ========================================================================
	)
	popd
) ELSE (
	echo.
	call :printLine
	echo    Missing files for WebClient apps setup:
	echo %i7mesg%
	call :printLine
	echo.
	call :halt 2
	set SINGLE_INSTALL=1
)
echo.
IF "%SINGLE_INSTALL%" EQU "1" (
    set SINGLE_INSTALL=
    call :halt 2
    goto menu
)
REM /* FD/FC Live/Train - end

:08_PRS
title [%osv%] [%arch%] Configuring Printing Service . . .
REM /* proceed if files all check out OK
IF "%i8stat%" EQU "OK" (
	pushd 07_WCA
	echo     ========================================================================
	echo     ^|    08 GDMS PrintService application setup . . .                      ^|
	echo     ^|======================================================================^|
	REM /* detect IF application already installed -- find program folder
	REM /*   \WebClientApps\SIME\PrintService
	echo     ^|       ^> Scanning GDMS PrintService installation . . .                ^|
	IF NOT EXIST "%ProgFiles%\WebClientApps\SIME\PrintService\" (
		echo     ^|         + No existing installation found.                            ^|
		echo     ^|                                                                      ^|
		call :checkVPN
		IF "!ERRORLEVEL!" EQU "1" (popd && goto :menu)
		echo     ^|                                                                      ^|
		echo     ^|       ^> Installing GDMS PrintService application . . .               ^|
		call "printservice.prowcapc"
		echo     ^|         - Press [Enter] after closing pop up dialog.                 ^|
		pause >nul
		echo     ^|         + Moving shortcut file . . .                                 ^|
		move /y "%desktop%\GDMS PrintService.lnk" "%gdms%" >nul 2>&1
		echo     ^|                                                                      ^|
		echo     ^|       GDMS PrintService application installed.                       ^|
		echo     ========================================================================
	) ELSE (
		REM /* skip installation
		echo     ^|         x Application found. Skipping installation.                  ^|
		echo     ^|         - To proceed with installation, please uninstall first.      ^|
		echo     ^|                                                                      ^|
		echo     ^|       GDMS PrintService installation aborted.                        ^|
		echo     ========================================================================
	)
	popd
) ELSE (
	echo.
	call :printLine
	echo    Missing files for PrintService setup:
	echo %i8mesg%
	call :printLine
	echo.
	call :halt 2
	set SINGLE_INSTALL=1
)
echo.
IF "%SINGLE_INSTALL%" EQU "1" (
    set SINGLE_INSTALL=
    call :halt 2
    goto menu
)
REM /* Print Service - end
goto :menu

REM /* globally available subroutines for cmd batch
:halt
IF "%1" EQU "" goto eof
ping -n %1 127.0.0.1 >nul
goto :eof

:printLine
set "ln= =============================================================================="
echo %ln%
goto :eof

:printBar
<nul set /p "=%BS%!ASCII_13!^|                                                                      ^|"
<nul set /p "=%BS%!ASCII_13!%1"
echo ^|
goto :eof

REM /* subroutine: checks files completion
:checkModule
IF "%1" EQU "" goto :eof
REM /* checks VPN files
IF "%1" EQU "1" (
	REM /* clear variables
	set i1stat=OK
	set "i1mesg="
	call :checkFile i1stat i1mesg "01_VPN\anyconnect-win-3.1.04059-web-deploy-k9.exe"
	IF "%webc%" EQU "FD" (
		call :checkFile i1stat i1mesg "10_Prerequisites\hd_preferences.xml"
		call :checkFile i1stat i1mesg "10_Prerequisites\hd_preferences_global.xml"
	)
	IF "%webc%" EQU "FC" (
		call :checkFile i1stat i1mesg "10_Prerequisites\ht_preferences.xml"
		call :checkFile i1stat i1mesg "10_Prerequisites\ht_preferences_global.xml"
	)
)
REM /* checks FTP files
IF "%1" EQU "2" (
	REM /* clear variables
	set i2stat=OK
	set i2mesg=
	call :checkFile i2stat i2mesg "02_FTP\FileZilla_Server-0_9_42.exe"
	call :checkFile i2stat i2mesg "10_Prerequisites\FileZilla Server.xml"
	call :checkFile i2stat i2mesg "10_Prerequisites\[ftproot] @ C.lnk"
	call :checkFile i2stat i2mesg "10_Prerequisites\[tmp] @ C.lnk"
)
REM /* checks PuTTY files
IF "%1" EQU "3" (
	REM /* clear variables
	set i3stat=OK
	set i3mesg=
	call :checkFile i3stat i3mesg "03_PUT\putty.exe"
	call :checkFile i3stat i3mesg "10_Prerequisites\GDMS.lnk"
	IF "%cmdv%" EQU "1" (
		call :checkFile i3stat i3mesg "10_Prerequisites\GDMSPRD_profile_WinGUI.cmd"
	) ELSE (
		IF "%osv%" EQU "Vista" (
			call :checkFile i3stat i3mesg "10_Prerequisites\GDMSPRD_profile_WinGUI.cmd"
		) ELSE (
			call :checkFile i3stat i3mesg "10_Prerequisites\GDMSPRD_profile_WinAero.cmd"
		)
	)
)
REM /* checks SAP Crystal Viewer Runtime files
IF "%1" EQU "4" (
	REM /* clear variables
	set i4stat=OK
	set i4mesg=
	call :checkFile i4stat i4mesg "04_CRV\CRRuntime_32bit_13_0_6.msi"
)
REM /* checks Progress WebClient v9 files
IF "%1" EQU "5" (
	REM /* clear variables
	set i5stat=OK
	set i5mesg=
	call :checkFile i5stat i5mesg "05_WC9\data1.cab"
	call :checkFile i5stat i5mesg "05_WC9\data1.hdr"
	call :checkFile i5stat i5mesg "05_WC9\data2.cab"
	call :checkFile i5stat i5mesg "05_WC9\ikernel.ex_"
	call :checkFile i5stat i5mesg "05_WC9\ImgHiResIS6.bmp"
	call :checkFile i5stat i5mesg "05_WC9\ImgLoResIS6.bmp"
	call :checkFile i5stat i5mesg "05_WC9\layout.bin"
	call :checkFile i5stat i5mesg "05_WC9\setup.bmp"
	call :checkFile i5stat i5mesg "05_WC9\Setup.exe"
	call :checkFile i5stat i5mesg "05_WC9\Setup.ini"
	call :checkFile i5stat i5mesg "05_WC9\setup.inx"
	IF "%arch%" EQU "x86" (
	    call :checkFile i5stat i5mesg "10_Prerequisites\WC9_x86.iss"
	)
	IF "%arch%" EQU "x64" (
		call :checkFile i5stat i5mesg "10_Prerequisites\WC9_x64.iss"
	)
)
REM /* checks OpenEdge WebClient v10 files
IF "%1" EQU "6" (
	REM /* clear variables
	set i6stat=OK
	set i6mesg=
	call :checkFile i6stat i6mesg "06_WC10\data1.cab"
	call :checkFile i6stat i6mesg "06_WC10\data1.hdr"
	call :checkFile i6stat i6mesg "06_WC10\data2.cab"
	call :checkFile i6stat i6mesg "06_WC10\iis_wc.reg"
	call :checkFile i6stat i6mesg "06_WC10\ImgHiResIS6.bmp"
	call :checkFile i6stat i6mesg "06_WC10\ImgLoResIS6.bmp"
	call :checkFile i6stat i6mesg "06_WC10\ISSetup.dll"
	call :checkFile i6stat i6mesg "06_WC10\lang.txt"
	call :checkFile i6stat i6mesg "06_WC10\layout.bin"
	call :checkFile i6stat i6mesg "06_WC10\setup.bmp"
	call :checkFile i6stat i6mesg "06_WC10\setup.exe"
	call :checkFile i6stat i6mesg "06_WC10\setup.ini"
	call :checkFile i6stat i6mesg "06_WC10\setup.inx"
	call :checkFile i6stat i6mesg "06_WC10\setup.zip"
	call :checkFile i6stat i6mesg "06_WC10\setupapplet.jar"
	call :checkFile i6stat i6mesg "06_WC10\_Graphics"
	call :checkFile i6stat i6mesg "06_WC10\_Setup.dll"
	IF "%arch%" EQU "x86" (
		call :checkFile i6stat i6mesg "10_Prerequisites\WC10_x86.iss"
	)
	IF "%arch%" EQU "x64" (
		call :checkFile i6stat i6mesg "10_Prerequisites\WC10_x64.iss"
	)
)
REM /* checks Webclient Apps: FD/FC Live/Train
IF "%1" EQU "7" (
	REM /* clear variables
	set i7stat=OK
	set i7mesg=
	IF "%webc%" EQU "FD" (
		call :checkFile i7stat i7mesg "07_WCA\fdlive.prowcapc"
		call :checkFile i7stat i7mesg "07_WCA\fdtrain.prowcapc"
	)
	IF "%webc%" EQU "FC" (
		call :checkFile i7stat i7mesg "07_WCA\fclive.prowcapc"
		call :checkFile i7stat i7mesg "07_WCA\fcrain.prowcapc"
	)
)
REM /* checks Webclient Apps: Print Service
IF "%1" EQU "8" (
	REM /* clear variables
	set i8stat=OK
	set i8mesg=
	call :checkFile i8stat i8mesg "07_WCA\printservice.prowcapc"
)
goto :eof

REM /* subroutine: detect VPN connection, return errorlevel
:checkVPN
echo     ^|       ^> Detecting VPN connection to Wisma Sime Darby . . .           ^|
ping -n 1 172.17.3.10 | findstr /r /c:"[0-9] *ms" >nul
IF "%ERRORLEVEL%" EQU "1" (
	REM /* Unable to reach server, request user to establish VPN connection
	echo     ^|         x VPN connection not established.                            ^|
	echo     ^|         - Please establish VPN using Cisco AnyConnect.               ^|
	REM /* execute Cisco AnyConnect on user's behalf
	start "" "%gdms%\Cisco AnyConnect Secure Mobility Client.lnk" >nul 2>&1
	echo     ^|         - Press [Enter] to continue after VPN is established.        ^|
	pause >nul
	ping -n 1 172.17.3.10 | findstr /r /c:"[0-9] *ms" >nul
	IF "!ERRORLEVEL!" EQU "1" (
		REM /* something went wrong, VPN not established, or user naughty, exit
		echo     ^|         x VPN connection still not established. Exiting . . .        ^|
		echo     ========================================================================
		set ret=1
	) ELSE (
		echo     ^|         + VPN connection status: ACTIVE                              ^|
		set ret=0
	)
) ELSE (
	echo     ^|         + VPN connection status: ACTIVE                              ^|
	set ret=0
)
exit /b %ret%

REM /* param: status, message, filename
:checkFile
IF NOT EXIST "%~3" (
	set "%1=xx"
	IF "!%2!" EQU "" (
		set "%2=!%2!        [%~3]"
	) ELSE (
		set "%2=!%2!!NL!        [%~3]"
	)
)
goto :eof

:end
echo.
echo                              ---==[ Goodbye! ]==---
echo.
call :halt 2
title %CMDCMDLINE:"=%
endlocal