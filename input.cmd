CLS REM On efface l'‚cran
@echo off
echo +-----------------------------------------------------------------------------+
echo ^| Fichier     : vers_autres.cmd                                               ^|
echo ^| Version     : 0.2                                                           ^|
echo ^| Auteur      : Bruno Boissonnet                                              ^|
echo ^| Date        : 17/07/2015                                                    ^|
echo ^| Description : Copie l'historique du serveur SRVLIN1 vers un poste OP_0X.    ^|
echo ^| Remarques   : Le fichier doit ˆtre sauvegard‚ au format ANSI.               ^|
echo ^|             : Copie tous les fichiers *.idx et *.lgh du dossier             ^|
echo ^|               D:\Expansia\Histo\ dans E:\vers_autres\.                      ^|
echo ^|             : Copie les fichiers *.idx et *.lgh sur le poste sélectionné.   ^|
echo +-----------------------------------------------------------------------------+
echo(
echo Faire Ctrl+C pour quitter le programme ou appuyer sur une touche pour continuer.

REM On fait une pause pour que la fenêtre reste affichée
pause>nul

REM +--DEBUT-DU-PROGRAMME---------------------------------------------------------+

REM echo "Affichage des caractŠres diacritiques fran‡ais au format ANSI :"
REM  "é è ç à â ê î ù"
REM echo "‚ Š ‡ … ƒ ˆ Œ —"

set /p UserInputPath= Entrer la date … partir de laquelle r‚cup‚rer les fichiers d'historique (au format mm-jj-aaaa)

echo(
echo Vous avez tap‚ : %UserInputPath%
echo Si la date est correcte (mois-jour-ann‚e), appuyer sur une touche.
echo Sinon faire Ctrl+C pour quitter le programme.
pause>nul

echo(
echo Tous les fichiers plus r‚cents que cette date (%UserInputPath%) seront r‚cup‚r‚s.

REM +--FIN-DU-PROGRAMME-----------------------------------------------------------+

echo(
REM On fait une pause pour que la fenêtre reste affichée
echo Appuyer sur une touche pour quitter le programme.
pause>nul


