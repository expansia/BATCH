CLS REM On efface l'‚cran
@echo off
echo +-----------------------------------------------------------------------------+
echo ^| Fichier     : Sauvegarde_Manuelle_Sur_ARAMON02.cmd                          ^|
echo ^| Version     : 0.1                                                           ^|
echo ^| Auteur      : Bruno Boissonnet                                              ^|
echo ^| Date        : 15/07/2015                                                    ^|
echo ^| Description : Copie la sauvegarde de DECA sur ARAMON02.                     ^|
echo ^| Remarques   : Le fichier doit ˆtre sauvegard‚ au format ANSI.               ^|
echo ^|             : dossier source : D:\SaveDECA\.                                ^|
echo ^|             : dossier destination : \\Aramon02\e$\SAUVEGARDES\DECAv7.10.32. ^|
echo +-----------------------------------------------------------------------------+
echo(
REM echo Faire Ctrl+C pour quitter le programme ou appuyer sur une touche pour continuer.

REM On fait une pause pour que la fenêtre reste affichée
REM pause>nul

REM +--DEBUT-DU-PROGRAMME---------------------------------------------------------+

echo "Affichage des caractŠres diacritiques fran‡ais au format ANSI :"
REM  "é è ç à â ê î ù"
REM echo "‚ Š ‡ … ƒ ˆ Œ —"

echo ***** Copie le dossier D:\SaveDECA vers \\Aramon02\e$\SAUVEGARDES\DECAv7.10.32
REM Paramètres de xcopy
REM /Y : Supprime la demande de confirmation de remplacement de fichiers de destination existants.
REM /E : Copie les répertoires et sous-répertoires, y compris les répertoires vides.
REM /V : Vérifie chaque nouveau fichier.

xcopy D:\SaveDECA\*.*  \\Aramon02\e$\SAUVEGARDES\DECAv7.10.32 /Y/E/V
%errorlevel%


REM +--FIN-DU-PROGRAMME-----------------------------------------------------------+

REM echo(
REM On fait une pause pour que la fenêtre reste affichée
REM echo Appuyer sur une touche pour quitter le programme.
REM pause>nul 




