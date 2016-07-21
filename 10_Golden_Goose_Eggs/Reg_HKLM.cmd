if not defined cmdv (
	:: file is executed directly
	echo.
	echo Please define 'cmdv' variable or run StartDeploy.cmd instead.
	exit /b
)

for /f "tokens=*" %%i in ('reg query "HKLM\SOFTWARE\Aventail VPN Client\Connections"') do set VAR=%%i
if "%VAR%"=="" (
	echo.
	echo Registry entry for HKLM not found. Please reinstall Aventail.
	echo.
) else (
	:: remove trailing spaces
	set VAR=%VAR%##
	set VAR=%VAR: ##=%
	set VAR=%VAR:##=%
	:: registry values
	reg add "%VAR%" /v "AmId" /t REG_BINARY /d "16504f4f4c3d415631313839313338313431373636505600" /f > nul
	reg add "%VAR%" /v "LastIpAddress" /t REG_SZ /d "172.17.40.132" /f > nul
	reg add "%VAR%" /v "LogonVersion" /t REG_DWORD /d "9" /f > nul
	reg add "%VAR%" /v "MachineIdentifier" /t REG_BINARY /d "010400000000000515000000358a021afe26c648235f636b" /f > nul 
	if %cmdv%==1 (
		:: Windows 2000, XP, 2003
		reg add "%VAR%" /v "PhoneBook" /t REG_SZ /d "%ALLUSERSPROFILE%\Application Data\Microsoft\Network\Connections\Pbk\rasphone.pbk" /f > nul
		:: Fill in content from rasphone.pbk
		rem type rasphone.pbk >> "%ALLUSERSPROFILE%\Application Data\Microsoft\Network\Connections\Pbk\rasphone.pbk"
	)
	if %cmdv%==2 (
		:: Windows Vista, 7
		reg add "%VAR%" /v "PhoneBook" /t REG_SZ /d "%ALLUSERSPROFILE%\Microsoft\Network\Connections\Pbk\rasphone.pbk" /f > nul
		:: Fill in content from rasphone.pbk
		rem type rasphone.pbk >> "%ALLUSERSPROFILE%\Microsoft\Network\Connections\Pbk\rasphone.pbk"
	)
	reg add "%VAR%" /v "PhoneBookEntry" /t REG_SZ /d "Aventail VPN Connection" /f > nul
	reg add "%VAR%" /v "PhoneNumber" /t REG_SZ /d "aventail.simedarby.com" /f > nul
	reg add "%VAR%" /v "PrerequisitePhonebook" /t REG_SZ /d "" /f > nul
	reg add "%VAR%" /v "PrerequisitePhoneBookEntry" /t REG_SZ /d "" /f > nul
	reg add "%VAR%" /v "TunnelIdentifier" /t REG_SZ /d "{1180E308-8C06-48B1-BF88-DDFF2452157A}" /f > nul
	reg add "%VAR%" /v "UserAuth" /t REG_SZ /d "" /f > nul
	reg add "%VAR%" /v "UserRealm" /t REG_SZ /d "SIMEDARBYGROUP.COM" /f > nul
	reg add "%VAR%\CurrentSettings" /v "IP" /t REG_SZ /d "172.17.40.132" /f > nul
	reg add "%VAR%\CurrentSettings" /v "RedirectionMode" /t REG_DWORD /d "1" /f > nul
)