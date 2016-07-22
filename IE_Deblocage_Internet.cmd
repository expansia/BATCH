CLS REM On efface l'‚cran
@echo off
echo +-----------------------------------------------------------------------------+
echo ^| Fichier     : IE_Deblocage_Internet.cmd                                     ^|
echo ^| Version     : 2.1                                                           ^|
echo ^| Auteur      : Bruno Boissonnet                                              ^|
echo ^| Date        : 11/07/2016                                                    ^|
echo ^| Description : Supprime les cl‚s du regsitre qui empˆchent la connexion      ^|
echo ^|             : … internet.                                                   ^|
echo ^| Remarques   : Le fichier doit ˆtre sauvegard‚ au format ANSI.               ^|
echo +-----------------------------------------------------------------------------+
echo(
echo Faire Ctrl+C pour quitter le programme ou appuyer sur une touche pour continuer.

REM On fait une pause pour que la fenêtre reste affichée
pause>nul

REM +--DEBUT-DU-PROGRAMME---------------------------------------------------------+

REM echo "Affichage des caractŠres diacritiques fran‡ais au format ANSI :"
REM  "é è ç à â ê î ù"
REM echo "‚ Š ‡ … ƒ ˆ Œ —"


echo ----------------------------------------------------------------- >> d:\exp_policies.log

REM ------------------------------------------------------------------

REM REG DELETE Nom_de_clé [/v Nom_de_valeur | /ve| /va] [/f]
REM Supprime la clé du registre passée en paramètre
REM  /f          Force la suppression sans demander de confirmation.

REM -----------------------------------------------------------------

REM REG ADD Nom_de_clé [/v Nom_de_valeur | /ve] [/t Type] [/s Séparateur]
                   [/d Données] [/f]
REM Crée une clé dans le registre
REM  /v       Nom de la valeur, sous la clé sélectionnée, à ajouter.
REM  /t       RegKey types de données
REM           [ REG_SZ    | REG_MULTI_SZ | REG_EXPAND_SZ |
REM             REG_DWORD | REG_QWORD    | REG_BINARY    | REG_NONE ]
REM           Si ce paramètre est omis, REG_SZ est pris par défaut.
REM  /d       Données à affecter au Nom_de_valeur ajouté
REM  /f       Force l'écrasement de l'entrée de Registre existante, sans
           confirmation.


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
REM On fait une pause pour que la fenêtre reste affichée
echo Appuyer sur une touche pour quitter le programme.
pause>nul

