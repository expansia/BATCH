CLS REM On efface l'‚cran
@echo off
echo +-----------------------------------------------------------------------------+
echo ^| Fichier     : Installation_FRA32_XML.bat                                    ^|
echo ^| Version     : 4.0                                                           ^|
echo ^| Auteur      : Bruno Boissonnet                                              ^|
echo ^| Date        : 06/08/2016                                                    ^|
echo ^| Description : Installation de Granta sur un poste client.                   ^|
echo ^|                                                                             ^|
echo ^| Remarques   : Le fichier doit ˆtre lanc‚ en MODE ADMINISTRATEUR.            ^|
echo ^|               Copie le fichier Fra32.XML dans le dossier adequat            ^|
echo ^|               afin d'avoir les informations "Point de Rassemblement",       ^|
echo ^|               "Matricule" etc ... dans l'onglet "Renseignements Personnels" ^|
echo ^|               du porteur de badge.                                          ^|
echo ^|               Le fichier doit ˆtre sauvegard‚ dans l'encodage ANSI(cp1252). ^|
echo +-----------------------------------------------------------------------------+
echo(
echo Faire Ctrl+C pour quitter le programme ou appuyer sur une touche pour continuer.

REM On fait une pause pour que la fenêtre reste affichée
pause>nul


REM +--DEBUT-DU-PROGRAMME---------------------------------------------------------+

:CHECKACCESS
set fname=Accchk.txt

:: Normalement, on utilise le dossier %windir%\System32,
:: mais les comptes EXPANSIA font partie du groupe administrateur;
:: donc on utilise le dossier %ProgramFiles%

:: echo It is ok to delete this file. It was just used for checking access. > %windir%\System32\%fname%
echo It is ok to delete this file. It was just used for checking access. > "%ProgramFiles%\%fname%"

:: IF NOT EXIST %windir%\System32\%fname% goto RUNADMIN
:: IF EXIST %windir%\System32\%fname% del /q /f %windir%\System32\%fname%
IF NOT EXIST "%ProgramFiles%\%fname%" goto RUNADMIN
IF EXIST "%ProgramFiles%\%fname%" del /q /f "%ProgramFiles%\%fname%"

goto MAIN


:RUNADMIN
echo(
echo Ce script doit ˆtre lanc‚ en mode administrateur.
echo Connectez vous en tant qu'administrateur ou faites un clic droit sur %~nx0 et "Ex‚cuter en tant qu'administrateur."
goto END


:MAIN
SET SOURCE=Fra32.XML
SET DESTINATION=C:\sysmgrsql\progs\

:: Va dans le dossier du script (pour trouver le fichier source)
pushd %~dp0

:: Copie le fichier %SOURCE% dans le dossier %DESTINATION%
copy /Y /V %SOURCE% %DESTINATION% > nul

:: /V     Vérifie l'écriture du ou des fichiers cible.
:: /Y     Supprime la confirmation de remplacement d'un fichier cible existant.


:: Test pour afficher la ligne de commande : OK
:: echo On
:: copy /Y /V hosts "C:\Windows\System32\drivers\etc\" > nul & echo off
:: echo off


echo(

if %ERRORLEVEL% == 0 (
	echo SUCCÔS. Fichier %SOURCE% copi‚ dans %DESTINATION% !
) else (
	echo ERREUR. Le fichier %SOURCE% n'a pas ‚t‚ copi‚ dans %DESTINATION%.
)

echo(

:: revient dans le dossier initial
popd



REM +--FIN-DU-PROGRAMME-----------------------------------------------------------+
:END
echo(
REM On fait une pause pour que la fenˆtre reste affich‚e
echo Appuyer sur une touche pour quitter le programme.
pause>nul 
