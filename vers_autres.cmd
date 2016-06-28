CLS REM On efface l'‚cran
@echo off
echo +-----------------------------------------------------------------------------+
echo ^| Fichier     : vers_autres.cmd                                               ^|
echo ^| Version     : 0.2                                                           ^|
echo ^| Auteur      : Bruno Boissonnet                                              ^|
echo ^| Date        : 17/07/2015                                                    ^|
echo ^| Description : Copie l'historique du serveur SRVLIN1 vers un autre poste.    ^|
echo ^| Remarques   : Le fichier doit ˆtre sauvegard‚ au format ANSI.               ^|
echo ^|             : 1) Copie tous les fichiers *.idx et *.lgh du dossier          ^|
echo ^|                 D:\Expansia\Histo\ dans E:\vers_autres\.                    ^|
echo ^|             : 2) Copie les fichiers *.idx et *.lgh sur le poste s‚lectionn‚.^|
echo +-----------------------------------------------------------------------------+
echo(
echo Faire Ctrl+C pour quitter le programme ou appuyer sur une touche pour continuer.

REM On fait une pause pour que la fenêtre reste affichée
pause>nul

REM +--DEBUT-DU-PROGRAMME----------------------------------------------------------+

REM echo "Affichage des caractŠres diacritiques fran‡ais au format ANSI :"
REM  "é è ç à â ê î ù"
REM echo "‚ Š ‡ … ƒ ˆ Œ —"



REM +--SUPPRESION DES ANCIENS FICHIERS IDX ET LGH----------------------------------+

echo(
echo ***** 1) Suppresion des anciens fichiers idx et lgh
REM Paramètres de del
REM /Q : Pas de confirmation avant suppression avec car. génériques.

del /Q E:\vers_autres\*.idx
del /Q E:\vers_autres\*.lgh


REM +--RECUPERATION-DES-FICHIERS-IDX-ET-LGH----------------------------------------+

echo(
echo ***** 2) R‚cupŠration des fichiers de D:\Expansia\Histo\
REM Paramètres de xcopy
REM /Y : Supprime la demande de confirmation de remplacement de fichiers de destination existants.
REM /E : Copie les répertoires et sous-répertoires, y compris les répertoires vides.
REM /V : Vérifie chaque nouveau fichier.
REM /d[:mm-dd-yyyy] : Copies source files changed on or after the specified date only.
REM                   If you do not include a mm-dd-yyyy value, xcopy copies all Source
REM                   files that are newer than existing Destination files. This command-line
REM                   option allows you to update files that have changed.



set /p UserInputPath= Entrer la date … partir de laquelle r‚cup‚rer les fichiers d'historique (au format mm-jj-aaaa)

echo(
echo Vous avez tap‚ : %UserInputPath%
echo Si la date est correcte (mois-jour-ann‚e), appuyer sur une touche.
echo Tous les fichiers plus r‚cents que cette date (%UserInputPath%) seront r‚cup‚r‚s.
echo Sinon faire Ctrl+C pour quitter le programme.
pause>nul
echo(


xcopy D:\Expansia\Histo\*.idx E:\vers_autres\ /d:%UserInputPath%
xcopy D:\Expansia\Histo\*.lgh E:\vers_autres\ /d:%UserInputPath%


REM +--SELECTION-DU-POSTE----------------------------------------------------------+

CLS REM On efface l'‚cran
echo(
echo ***** 2) S‚lection du poste … r‚cup‚rer.
REM:debut

echo a- Copier sur OP_01
echo b- Copier sur OP_02
echo c- Copier sur OP_03
echo d- Copier sur OP_04
echo e- Copier sur OP_05
echo f- Copier sur OP_06
echo g- Copier sur OP_07
echo h- Copier sur OP_08
echo i- Copier sur SRVLIN2
echo j- Copier sur REPLI

CHOICE /C abcdefghij /N /T 90 /D a /M "Choisissez le poste … r‚cup‚rer."

if errorlevel 10 SET POSTE=REPLI
if errorlevel 9 SET POSTE=SRVLIN2
If errorlevel 8 SET POSTE=OP_08
If errorlevel 7 SET POSTE=OP_07
if errorlevel 6 SET POSTE=OP_06
if errorlevel 5 SET POSTE=OP_05
If errorlevel 4 SET POSTE=OP_04
If errorlevel 3 SET POSTE=OP_03
if errorlevel 2 SET POSTE=OP_02
if errorlevel 1 SET POSTE=OP_01

echo(
echo Vous avez tap‚ : %POSTE%
echo Si le nom du poste est correct, appuyer sur une touche.
echo Sinon faire Ctrl+C pour quitter le programme.
pause>nul


REM +--COPIE-DES-FICHIERS-SUR-LE-POSTE---------------------------------------------+

echo(
echo Copie vers %POSTE% : BAT01
echo =========================
xcopy E:\vers_autres\*.idx \\%POSTE%\d$\EXPANSIA\Histo\ /Y
xcopy E:\vers_autres\*.lgh \\%POSTE%\d$\EXPANSIA\Histo\ /Y

REM On fait les tests dans un r‚pertoire temporaire d:\test_bruno sur le poste
REM xcopy E:\vers_autres\*.idx \\%POSTE%\d$\test_bruno\ /Y
REM xcopy E:\vers_autres\*.lgh \\%POSTE%\d$\test_bruno\ /Y


REM +--FIN-DU-PROGRAMME-----------------------------------------------------------+

echo(
REM On fait une pause pour que la fenêtre reste affichée
echo Appuyer sur une touche pour quitter le programme.
pause>nul 
exit


