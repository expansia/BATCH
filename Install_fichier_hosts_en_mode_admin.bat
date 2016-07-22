CLS REM On efface l'‚cran
@echo off
echo +-----------------------------------------------------------------------------+
echo ^| Fichier     : Install_fichier_hosts_en_mode_admin.bat                       ^|
echo ^| Version     : 0.1                                                           ^|
echo ^| Auteur      : Bruno Boissonnet                                              ^|
echo ^| Date        : 22/07/2016                                                    ^|
echo ^| Description : Copie le fichier hosts dans le r‚pertoire windows.            ^|
echo ^|                                                                             ^|
echo ^| Remarques   : Le fichier doit ˆtre sauvegard‚ dans l'encodage ANSI(cp1252). ^|
echo ^|               Le fichier doit ˆtre lanc‚ en MODE ADMINISTRATEUR.            ^|
echo +-----------------------------------------------------------------------------+
echo(
echo Faire Ctrl+C pour quitter le programme ou appuyer sur une touche pour continuer.

REM On fait une pause pour que la fenêtre reste affichée
pause>nul

REM +--DEBUT-DU-PROGRAMME---------------------------------------------------------+

:: Va dans le dossier du script (pour trouver le fichier source)
pushd %~dp0


:: Copie le fichier dans le dossier "etc"
copy /Y /V hosts "C:\Windows\System32\drivers\etc\" > nul

:: Test pour afficher la ligne de commande : OK
:: echo On
:: copy /Y /V hosts "C:\Windows\System32\drivers\etc\" > nul & echo off
:: echo off


echo(

if %ERRORLEVEL% == 0 (
	echo SUCCÔS. Fichier "hosts" copi‚ dans C:\Windows\System32\drivers\etc\ !
) else (
	echo ERREUR. Le fichier n'a pas ‚t‚ copi‚.
)

echo(

:: revient dans le dossier initial
popd

REM +--FIN-DU-PROGRAMME-----------------------------------------------------------+

echo(
REM On fait une pause pour que la fenêtre reste affichée
echo Appuyer sur une touche pour quitter le programme.
pause>nul 
