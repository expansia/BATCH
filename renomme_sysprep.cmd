CLS REM On efface l'‚cran
@echo off
echo +-----------------------------------------------------------------------------+
echo ^| Fichier     : renomme_sysprep.bat                                           ^|
echo ^| Version     : 1                                                             ^|
echo ^| Auteur      : Bruno Boissonnet                                              ^|
echo ^| Date        : 24/06/2016                                                    ^|
echo ^| Description : Renomme le fichier sysprep.bat en sysprep.bat.old.            ^|
echo ^| Remarques   : Le fichier doit ˆtre sauvegard‚ au format ANSI.               ^|
echo ^|                                                                             ^|
echo +-----------------------------------------------------------------------------+
echo(
echo Faire Ctrl+C pour quitter le programme ou appuyer sur une touche pour continuer.

REM On fait une pause pour que la fenêtre reste affichée
pause>nul

REM +--DEBUT-DU-PROGRAMME---------------------------------------------------------+

:: Renomme le fichier sysprep.bat en sysprep.bat.old.

ren d:\INFORMATIQUE\sysprep.bat sysprep.bat.old

REM +--FIN-DU-PROGRAMME-----------------------------------------------------------+

echo(
REM On fait une pause pour que la fenêtre reste affichée
echo Appuyer sur une touche pour quitter le programme.
pause>nul

REM +--ACCENTS-EN-CODEPAGE-850----------------------------------------------------+
REM echo "Affichage des caractŠres diacritiques fran‡ais au format console :"
REM  "é è ç à â ê î ù"
REM echo "‚ Š ‡ … ƒ ˆ Œ —"
