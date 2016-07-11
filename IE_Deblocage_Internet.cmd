CLS REM On efface l'�cran
@echo off
echo +-----------------------------------------------------------------------------+
echo ^| Fichier     : IE_Deblocage_Internet.cmd                                     ^|
echo ^| Version     : 2.0                                                           ^|
echo ^| Auteur      : Bruno Boissonnet                                              ^|
echo ^| Date        : 11/07/2016                                                    ^|
echo ^| Description : Supprime les cl�s du regsitre qui emp�chent la connexion      ^|
echo ^|             : � internet.                                                   ^|
echo ^| Remarques   : Le fichier doit �tre sauvegard� au format ANSI.               ^|
echo +-----------------------------------------------------------------------------+
echo(
echo Faire Ctrl+C pour quitter le programme ou appuyer sur une touche pour continuer.

REM On fait une pause pour que la fen�tre reste affich�e
pause>nul

REM +--DEBUT-DU-PROGRAMME---------------------------------------------------------+

REM echo "Affichage des caract�res diacritiques fran�ais au format ANSI :"
REM  "� � � � � � � �"
REM echo "� � � � � � � �"


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


REM +--FIN-DU-PROGRAMME-----------------------------------------------------------+

echo(
REM On fait une pause pour que la fen�tre reste affich�e
echo Appuyer sur une touche pour quitter le programme.
pause>nul

