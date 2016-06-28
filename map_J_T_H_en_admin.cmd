CLS REM On efface l'‚cran
@echo off
echo +-----------------------------------------------------------------------------+
echo ^| Fichier     : map_J_T_H_en_admin.cmd                                        ^|
echo ^| Version     : 3                                                             ^|
echo ^| Auteur      : Bruno Boissonnet                                              ^|
echo ^| Date        : 28/01/2016                                                    ^|
echo ^| Description : Connecte les lecteurs H, J et T en EXPANSIA\administrateur.   ^|
echo ^| Remarques   : Le fichier doit ˆtre sauvegard‚ au format ANSI.               ^|
echo ^|               \\ARAMON05\Data     => H                                      ^|
echo ^|               \\ARAMON05\Groupes  = J                                       ^|
echo ^|               \\ARAMON05\Global   = T                                       ^|
echo +-----------------------------------------------------------------------------+
echo(
echo Faire Ctrl+C pour quitter le programme ou appuyer sur une touche pour continuer.

REM On fait une pause pour que la fenêtre reste affichée
pause>nul

REM +--DEBUT-DU-PROGRAMME---------------------------------------------------------+

:: Connecte les lecteurs H, J et T

NET USE H: \\192.168.9.5\Data ftixda74vf /user:administrateur
NET USE J: \\192.168.9.5\Groupes ftixda74vf /user:administrateur
NET USE T: \\192.168.9.5\Global ftixda74vf /user:administrateur

REM +--FIN-DU-PROGRAMME-----------------------------------------------------------+

echo(
REM On fait une pause pour que la fenêtre reste affichée
echo Appuyer sur une touche pour quitter le programme.
pause>nul

REM +--ACCENTS-EN-CODEPAGE-850----------------------------------------------------+
REM echo "Affichage des caractŠres diacritiques fran‡ais au format console :"
REM  "é è ç à â ê î ù"
REM echo "‚ Š ‡ … ƒ ˆ Œ —"