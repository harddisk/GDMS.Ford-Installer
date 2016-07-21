for /f "tokens=*" %%i in ('reg query "HKCU\Software\Aventail VPN Client\Connections"') do set VAR=%%i
if "%VAR%"=="" (
	echo.
	echo Registry entry for HKCU not found. Please reinstall Aventail.
	echo.
) else (
	:: remove trailing spaces
	set VAR=%VAR%##
	set VAR=%VAR: ##=%
	set VAR=%VAR:##=%
	:: registry values
	reg add "%VAR%" /v "ConnectingStatusDelay" /t REG_DWORD /d "2000" /f > nul
	reg add "%VAR%" /v "LastSecondaryUser" /t REG_SZ /d "" /f > nul
	reg add "%VAR%" /v "LastUpdatePromptHigh" /t REG_DWORD /d "0" /f > nul
	reg add "%VAR%" /v "LastUpdatePromptLow" /t REG_DWORD /d "0" /f > nul
	reg add "%VAR%" /v "LastUser" /t REG_SZ /d "" /f > nul
	reg add "%VAR%" /v "LastUserCert" /t REG_SZ /d "" /f > nul
	reg add "%VAR%" /v "NetworkConflictResolution" /t REG_DWORD /d "0" /f > nul
	reg add "%VAR%" /v "NotifyIfConnectionLost" /t REG_DWORD /d "1" /f > nul
	reg add "%VAR%" /v "PromptToConnectIfConnectionLost" /t REG_DWORD /d "1" /f > nul
	reg add "%VAR%" /v "ShowConnectingStatus" /t REG_DWORD /d "1" /f > nul
	reg add "%VAR%" /v "ShowTaskbarStatusIcon" /t REG_DWORD /d "1" /f > nul
	reg add "%VAR%" /v "UserRealm" /t REG_SZ /d "SIMEDARBYGROUP.COM" /f > nul
	reg add "%VAR%\CurrentSettings" /v "IsSuspended" /t REG_DWORD /d "0" /f > nul
	reg add "%VAR%\FallbackLists\aventail.simedarby.com" /v "LastRealmUsed" /t REG_SZ /d "SIMEDARBYGROUP.COM" /f > nul
	reg add "%VAR%\Realm\SIMEDARBYGROUP.COM" /v "0Flags" /t REG_DWORD /d "268451840" /f > nul
	reg add "%VAR%\Realm\SIMEDARBYGROUP.COM" /v "0Prompt" /t REG_SZ /d "IDS_AUTHENTICATION_DIALOG_MESSAGE" /f > nul
	reg add "%VAR%\Realm\SIMEDARBYGROUP.COM" /v "0Value" /t REG_SZ /d "Log in here to establish a secure connection to your network resources." /f > nul
	reg add "%VAR%\Realm\SIMEDARBYGROUP.COM" /v "1Flags" /t REG_DWORD /d "81921" /f > nul
	reg add "%VAR%\Realm\SIMEDARBYGROUP.COM" /v "1Prompt" /t REG_SZ /d "IDS_AUTHENTICATION_PROMPT_USERNAME" /f > nul
	reg add "%VAR%\Realm\SIMEDARBYGROUP.COM" /v "1Value" /t REG_SZ /d "" /f > nul
	reg add "%VAR%\Realm\SIMEDARBYGROUP.COM" /v "2Flags" /t REG_DWORD /d "147458" /f > nul
	reg add "%VAR%\Realm\SIMEDARBYGROUP.COM" /v "2Prompt" /t REG_SZ /d "IDS_AUTHENTICATION_PROMPT_PASSWORD" /f > nul
	reg add "%VAR%\Realm\SIMEDARBYGROUP.COM" /v "AuthVersion" /t REG_DWORD /d "9" /f > nul
	reg add "%VAR%\Realm\SIMEDARBYGROUP.COM" /v "Buttons" /t REG_DWORD /d "35" /f > nul
	reg add "%VAR%\Realm\SIMEDARBYGROUP.COM" /v "CertAuth" /t REG_DWORD /d "0" /f > nul
	reg add "%VAR%\Realm\SIMEDARBYGROUP.COM" /v "Title" /t REG_SZ /d "IDS_AUTHENTICATION_DIALOG_TITLE" /f > nul
	reg add "%VAR%\Realm\SIMEDARBYGROUP.COM" /v "TitleFlags" /t REG_DWORD /d "16384" /f > nul
)