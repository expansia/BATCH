CLS REM On efface l'‚cran
@echo off
echo +-----------------------------------------------------------------------------+
echo ^| Fichier     : Installation_FRA32_XML.bat                                    ^|
echo ^| Version     : 3.0                                                           ^|
echo ^| Auteur      : Bruno Boissonnet                                              ^|
echo ^| Date        : 06/08/2016                                                    ^|
echo ^| Description : Installation de Granta sur un poste client.                   ^|
echo ^|                                                                             ^|
echo ^| Remarques   : Le fichier doit ˆtre sauvegard‚ dans l'encodage ANSI(cp1252). ^|
echo ^|               Le fichier doit ˆtre lanc‚ en MODE ADMINISTRATEUR.            ^|
echo ^|               Copie le fichier Fra32.XML dans le dossier adequat            ^|
echo ^|               afin d'avoir les informations "Point de Rassemblement",       ^|
echo ^|               "Matricule" etc ... dans l'onglet "Renseignements Personnels" ^|
echo ^|               du porteur de badge.                                          ^|
echo +-----------------------------------------------------------------------------+
echo(
echo Faire Ctrl+C pour quitter le programme ou appuyer sur une touche pour continuer.

REM On fait une pause pour que la fenêtre reste affichée
pause>nul




REM +--DEBUT-DU-PROGRAMME---------------------------------------------------------+


SET SOURCE=Fra32.XML
SET DESTINATION=C:\sysmgrsql\progs\


:: Va dans le dossier du script (pour trouver le fichier source)
pushd %~dp0


:: Copie le fichier dans le dossier "etc"
copy /Y /V %SOURCE% %DESTINATION% > nul

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

echo(
REM On fait une pause pour que la fenêtre reste affichée
echo Appuyer sur une touche pour quitter le programme.
pause>nul 
