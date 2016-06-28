echo OFF
REM Supprime les cl�s du registre qui permette d'emp�cher la connexion internet.


echo ----------------------------------------------------------------- >> d:\exp_policies.log


reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /f
echo %DATE% %TIME% Suppression de la clef ProxyServer : %errorlevel% >> d:\exp_policies.log

reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /f
echo %DATE% %TIME% Suppression de la clef ProxyOverride : %errorlevel% >> d:\exp_policies.log

reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /f
echo %DATE% %TIME% Suppression de la clef ProxyEnable : %errorlevel% >> d:\exp_policies.log

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
echo %DATE% %TIME% Ajout de la clef ProxyEnable : %errorlevel% >> d:\exp_policies.log

reg delete "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v ConnectionsTab /f
echo %DATE% %TIME% Suppression de la clef ConnectionsTab : %errorlevel% >> d:\exp_policies.log