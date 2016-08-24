CLS REM On efface l'‚cran
@echo off
echo +-----------------------------------------------------------------------------+
echo ^| Fichier     : Sauvegarde_Manuelle_Sur_ARAMON02.cmd                          ^|
echo ^| Version     : 0.2                                                           ^|
echo ^| Auteur      : Bruno Boissonnet                                              ^|
echo ^| Date        : 15/07/2015                                                    ^|
echo ^| Description : Copie la sauvegarde de DECA sur ARAMON02.                     ^|
echo ^| Remarques   : Ce script est lanc, par une t‡che planifi,e.                  ^|
echo ^|               Dossier source : D:\SaveDECA\.                                ^|
echo ^|               Dossier destination : \\Aramon02\e$\SAUVEGARDES\DECAv7.10.32. ^|
echo ^|               Le fichier doit ˆtre sauvegard‚ dans l'encodage ANSI(cp1252). ^|
echo +-----------------------------------------------------------------------------+
echo(
REM echo Faire Ctrl+C pour quitter le programme ou appuyer sur une touche pour continuer.

REM On fait une pause pour que la fenêtre reste affichée
REM pause>nul

REM +--DEBUT-DU-PROGRAMME---------------------------------------------------------+


SET SOURCE=D:\SaveDECA\
SET DESTINATION=\\Aramon02\e$\SAUVEGARDES\DECAv7.10.32


echo ***** Copie le dossier %SOURCE% vers %DESTINATION%
REM Paramètres de xcopy
REM /Y : Supprime la demande de confirmation de remplacement de fichiers de destination existants.
REM /E : Copie les répertoires et sous-répertoires, y compris les répertoires vides.
REM /V : Vérifie chaque nouveau fichier.

xcopy %SOURCE%*.*  %DESTINATION% /Y/E/V

%errorlevel% REM on renvoie le code d'erreur car le r,sultat du script va dans un fichier log.


REM +--FIN-DU-PROGRAMME-----------------------------------------------------------+

REM echo(
REM On fait une pause pour que la fenêtre reste affichée
REM echo Appuyer sur une touche pour quitter le programme.
REM pause>nul 




