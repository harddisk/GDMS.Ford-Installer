::
:: GDMSPRD profile generator for PuTTY version 1.0
:: Copyright (c) 2013 by Cw Tham (harddisk@gmail.com)
::
:: Must be executed with Administrator privileges
::
:: Profile shared settings
::
set /p "=GDMSPRD profile - "<nul
set /p "= A"<nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "AddressFamily" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "AgentFwd" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "AltF4" /t REG_DWORD /d "1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "AltOnly" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "AltSpace" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "AlwaysOnTop" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "ANSIColour" /t REG_DWORD /d "1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Answerback" /t REG_SZ /d "PuTTY" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "ApplicationCursorKeys" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "ApplicationKeypad" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "AuthKI" /t REG_DWORD /d "1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "AuthTIS" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "AutoWrapMode" /t REG_DWORD /d "1" /f >nul

set /p "= , B"<nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "BackspaceIsDelete" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "BCE" /t REG_DWORD /d "1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Beep" /t REG_DWORD /d "1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "BeepInd" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "BellOverload" /t REG_DWORD /d "1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "BellOverloadN" /t REG_DWORD /d "5" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "BellOverloadS" /t REG_DWORD /d "5000" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "BellOverloadT" /t REG_DWORD /d "2000" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "BellWaveFile" /t REG_SZ /d "" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "BlinkCur" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "BlinkText" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "BoldAsColour" /t REG_DWORD /d "1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "BoldFont" /t REG_SZ /d "" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "BoldFontCharSet" /t REG_DWORD /d "546683640" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "BoldFontHeight" /t REG_DWORD /d "1999335925" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "BoldFontIsBold" /t REG_DWORD /d "1638264" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "BugDeriveKey2" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "BugHMAC2" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "BugIgnore1" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "BugPKSessID2" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "BugPlainPW1" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "BugRSA1" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "BugRSAPad2" /t REG_DWORD /d "0" /f >nul

set /p "= , C"<nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "CapsLockCyr" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "ChangeUsername" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Cipher" /t REG_SZ /d "aes,blowfish,3des,WARN,arcfour,des" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "CJKAmbigWide" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "CloseOnExit" /t REG_DWORD /d "2" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Colour0" /t REG_SZ /d "0,0,0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Colour1" /t REG_SZ /d "255,255,255" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Colour10" /t REG_SZ /d "0,128,0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Colour11" /t REG_SZ /d "85,255,85" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Colour12" /t REG_SZ /d "187,187,0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Colour13" /t REG_SZ /d "255,255,85" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Colour14" /t REG_SZ /d "0,0,128" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Colour15" /t REG_SZ /d "85,85,255" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Colour16" /t REG_SZ /d "187,0,187" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Colour17" /t REG_SZ /d "255,85,255" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Colour18" /t REG_SZ /d "0,187,187" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Colour19" /t REG_SZ /d "85,255,255" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Colour2" /t REG_SZ /d "192,192,192" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Colour20" /t REG_SZ /d "187,187,187" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Colour21" /t REG_SZ /d "255,255,255" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Colour3" /t REG_SZ /d "85,85,85" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Colour4" /t REG_SZ /d "0,0,0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Colour5" /t REG_SZ /d "255,255,128" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Colour6" /t REG_SZ /d "0,0,0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Colour7" /t REG_SZ /d "85,85,85" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Colour8" /t REG_SZ /d "128,0,0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Colour9" /t REG_SZ /d "255,85,85" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "ComposeKey" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Compression" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "CtrlAltKeys" /t REG_DWORD /d "1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "CurType" /t REG_DWORD /d "0" /f >nul

set /p "= , D"<nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "DECOriginMode" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "DisableArabicShaping" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "DisableBidi" /t REG_DWORD /d "0" /f >nul

set /p "= , E"<nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Environment" /t REG_SZ /d "" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "EraseToScrollback" /t REG_DWORD /d "1" /f >nul

set /p "= , F"<nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "FontCharSet" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "FontHeight" /t REG_DWORD /d "10" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "FontIsBold" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "FontVTMode" /t REG_DWORD /d "4" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "FullScreenOnAltEnter" /t REG_DWORD /d "0" /f >nul

set /p "= , H"<nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "HideMousePtr" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "HostName" /t REG_SZ /d "172.17.3.10" /f >nul

set /p "= , K"<nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "KEX" /t REG_SZ /d "dh-gex-sha1,dh-group14-sha1,dh-group1-sha1,WARN" /f >nul

set /p "= , L"<nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "LFImpliesCR" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "LineCodePage" /t REG_SZ /d "CP437" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "LinuxFunctionKeys" /t REG_DWORD /d "5" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "LocalEcho" /t REG_DWORD /d "2" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "LocalEdit" /t REG_DWORD /d "2" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "LocalPortAcceptAll" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "LocalUserName" /t REG_SZ /d "" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "LockSize" /t REG_DWORD /d "2" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "LogFileClash" /t REG_DWORD /d "4294967295" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "LogFileName" /t REG_SZ /d "putty.log" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "LogFlush" /t REG_DWORD /d "1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "LoginShell" /t REG_DWORD /d "1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "LogType" /t REG_DWORD /d "0" /f >nul

set /p "= , M"<nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "MouseIsXterm" /t REG_DWORD /d "2" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "MouseOverride" /t REG_DWORD /d "1" /f >nul

set /p "= , N"<nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "NetHackKeypad" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "NoAltScreen" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "NoApplicationCursors" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "NoApplicationKeys" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "NoDBackspace" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "NoMouseReporting" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "NoPTY" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "NoRemoteCharset" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "NoRemoteQTitle" /t REG_DWORD /d "1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "NoRemoteResize" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "NoRemoteWinTitle" /t REG_DWORD /d "0" /f >nul

set /p "= , P"<nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "PassiveTelnet" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "PasteRTF" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "PingInterval" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "PingIntervalSecs" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "PortForwardings" /t REG_SZ /d "" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "PortNumber" /t REG_DWORD /d "23" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Present" /t REG_DWORD /d "1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Printer" /t REG_SZ /d "" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Protocol" /t REG_SZ /d "telnet" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "ProxyDNS" /t REG_DWORD /d "1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "ProxyExcludeList" /t REG_SZ /d "" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "ProxyHost" /t REG_SZ /d "proxy" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "ProxyLocalhost" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "ProxyMethod" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "ProxyPassword" /t REG_SZ /d "" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "ProxyPort" /t REG_DWORD /d "80" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "ProxyTelnetCommand" /t REG_SZ /d "connect %host %port\n" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "ProxyUsername" /t REG_SZ /d "" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "PublicKeyFile" /t REG_SZ /d "" /f >nul

set /p "= , R"<nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "RawCNP" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "RectSelect" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "RekeyBytes" /t REG_SZ /d "1G" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "RekeyTime" /t REG_DWORD /d "60" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "RemoteCommand" /t REG_SZ /d "" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "RemotePortAcceptAll" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "RFCEnviron" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "RXVTHomeEnd" /t REG_DWORD /d "0" /f >nul

set /p "= , S"<nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "ScrollbackLines" /t REG_DWORD /d "200" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "ScrollBar" /t REG_DWORD /d "1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "ScrollBarFullScreen" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "ScrollbarOnLeft" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "ScrollOnDisp" /t REG_DWORD /d "1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "ScrollOnKey" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "ShadowBold" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "ShadowBoldOffset" /t REG_DWORD /d "1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "SSH2DES" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "SSHLogOmitData" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "SSHLogOmitPasswords" /t REG_DWORD /d "1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "SshNoAuth" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "SshNoShell" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "SshProt" /t REG_DWORD /d "2" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "StampUtmp" /t REG_DWORD /d "1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "SunkenEdge" /t REG_DWORD /d "0" /f >nul

set /p "= , T"<nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "TCPKeepalives" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "TCPNoDelay" /t REG_DWORD /d "1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "TelnetKey" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "TelnetRet" /t REG_DWORD /d "1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "TermHeight" /t REG_DWORD /d "25" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "TerminalModes" /t REG_SZ /d "INTR=A,QUIT=A,ERASE=A,KILL=A,EOF=A,EOL=A,EOL2=A,START=A,STOP=A,SUSP=A,DSUSP=A,REPRINT=A,WERASE=A,LNEXT=A,FLUSH=A,SWTCH=A,STATUS=A,DISCARD=A,IGNPAR=A,PARMRK=A,INPCK=A,ISTRIP=A,INLCR=A,IGNCR=A,ICRNL=A,IUCLC=A,IXON=A,IXANY=A,IXOFF=A,IMAXBEL=A,ISIG=A,ICANON=A,XCASE=A,ECHO=A,ECHOE=A,ECHOK=A,ECHONL=A,NOFLSH=A,TOSTOP=A,IEXTEN=A,ECHOCTL=A,ECHOKE=A,PENDIN=A,OPOST=A,OLCUC=A,ONLCR=A,OCRNL=A,ONOCR=A,ONLRET=A,CS7=A,CS8=A,PARENB=A,PARODD=A," /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "TerminalSpeed" /t REG_SZ /d "38400,38400" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "TerminalType" /t REG_SZ /d "xterm" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "TermWidth" /t REG_DWORD /d "80" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "TryPalette" /t REG_DWORD /d "0" /f >nul

set /p "= , U"<nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "UserName" /t REG_SZ /d "" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "UseSystemColours" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "UTF8Override" /t REG_DWORD /d "1" /f >nul

set /p "= , W"<nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "WarnOnClose" /t REG_DWORD /d "1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "WideBoldFont" /t REG_SZ /d "" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "WideBoldFontCharSet" /t REG_DWORD /d "1635056" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "WideBoldFontHeight" /t REG_DWORD /d "16813452" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "WideBoldFontIsBold" /t REG_DWORD /d "1016" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "WideFont" /t REG_SZ /d "" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "WideFontCharSet" /t REG_DWORD /d "1638264" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "WideFontHeight" /t REG_DWORD /d "1634796" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "WideFontIsBold" /t REG_DWORD /d "1635056" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "WindowBorder" /t REG_DWORD /d "1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "WinNameAlways" /t REG_DWORD /d "1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "WinTitle" /t REG_SZ /d "" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Wordness0" /t REG_SZ /d "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Wordness128" /t REG_SZ /d "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Wordness160" /t REG_SZ /d "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Wordness192" /t REG_SZ /d "2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Wordness224" /t REG_SZ /d "2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Wordness32" /t REG_SZ /d "0,1,2,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Wordness64" /t REG_SZ /d "1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,2" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Wordness96" /t REG_SZ /d "1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1" /f >nul

set /p "= , X"<nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "X11AuthType" /t REG_DWORD /d "1" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "X11Display" /t REG_SZ /d "" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "X11Forward" /t REG_DWORD /d "0" /f >nul
reg add "HKCU\Software\SimonTatham\PuTTY\Sessions\GDMSPRD" /v "Xterm256Colour" /t REG_DWORD /d "1" /f >nul