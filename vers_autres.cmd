CLS :: On efface l'‚cran
@echo off
echo +-----------------------------------------------------------------------------+
echo ^| Fichier     : vers_autres.cmd                                               ^|
echo ^| Version     : 3.0                                                           ^|
echo ^| Auteur      : Bruno Boissonnet                                              ^|
echo ^| Date        : 07/08/2016                                                    ^|
echo ^| Description : Copie l'historique du serveur SRVLIN1 vers un autre poste.    ^|
echo ^| Remarques   : Le fichier doit ˆtre sauvegard‚ au format ANSI.               ^|
echo ^|             : 1) Copie tous les fichiers *.idx et *.lgh du dossier          ^|
echo ^|                 D:\Expansia\Histo\ dans E:\vers_autres\.                    ^|
echo ^|             : 2) Copie les fichiers *.idx et *.lgh sur le poste s‚lectionn‚.^|
echo +-----------------------------------------------------------------------------+
echo(
echo Faire Ctrl+C pour quitter le programme ou appuyer sur une touche pour continuer.

:: On fait une pause pour que la fenêtre reste affichée
pause>nul

:: +--DEBUT-DU-PROGRAMME----------------------------------------------------------+


:: +--SUPPRESION DES ANCIENS FICHIERS IDX ET LGH----------------------------------+

echo(
echo ***** 1) Suppresion des anciens fichiers idx et lgh
echo(
:: Paramètres de del
:: /Q : Pas de confirmation avant suppression avec car. génériques.

del /Q E:\vers_autres\*.idx
del /Q E:\vers_autres\*.lgh



:: +--RECUPERATION-DES-FICHIERS-IDX-ET-LGH----------------------------------------+

:recuperation_des_fichiers
CLS :: On efface l'‚cran
echo(
echo ***** 2) R‚cupŠration des fichiers de D:\Expansia\Histo\ dans E:\vers_autres\
echo(
:: Paramètres de xcopy
:: /Y : Supprime la demande de confirmation de remplacement de fichiers de destination existants.
:: /E : Copie les répertoires et sous-répertoires, y compris les répertoires vides.
:: /V : Vérifie chaque nouveau fichier.
:: /d[:mm-dd-yyyy] : Copies source files changed on or after the specified date only.
::                   If you do not include a mm-dd-yyyy value, xcopy copies all Source
::                   files that are newer than existing Destination files. This command-line
::                   option allows you to update files that have changed.



set /p UserInputPath= Entrer la date … partir de laquelle r‚cup‚rer les fichiers d'historique (au format jj/mm/aaaa)

echo(
:: R‚cupŠration de la date au format long (jour Num mois ann‚e)
for /f "delims=" %%a in ('powershell -Command "Get-Date -Date %UserInputPath% -format D"') do @set DATE_LONGUE=%%a

echo Vous avez tap‚ : %UserInputPath%
echo Tous les fichiers plus r‚cents que le %DATE_LONGUE% seront r‚cup‚r‚s.
set ma_saisie=
set /p ma_saisie=Appuyer sur ENTRER pour valider ou sur toute autre touche puis ENTRER pour pour modifier la date. Faire Ctrl+C pour quitter le programme.

if DEFINED ma_saisie goto recuperation_des_fichiers :: Si on appuie sur ENTRER seulement, ma_saisie n'est pas définie

:: On met la date au format exig, par XCOPY (mm/jj/aaaa)
SET DATE_RECUP=%UserInputPath:~3,2%-%UserInputPath:~0,2%-%UserInputPath:~6,4%
echo %DATE_RECUP%

:: R‚cupŠration des fichiers dans E:\vers_autres\
xcopy D:\Expansia\Histo\*.idx E:\vers_autres\ /d:%DATE_RECUP%
xcopy D:\Expansia\Histo\*.lgh E:\vers_autres\ /d:%DATE_RECUP%




:: +--SELECTION-DU-POSTE----------------------------------------------------------+

:selection_du_poste

CLS :: On efface l'‚cran
echo(
echo ***** 2) S‚lection du poste … r‚cup‚rer.
echo(

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
echo(

CHOICE /C abcdefghij /N /T 90 /D a /M "Choisissez le poste … r‚cup‚rer en tapant la lettre correspondante (ex: a pour OP_01)."

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
set ma_saisie=
set /p ma_saisie=Appuyer sur ENTRER pour valider ou sur toute autre touche puis ENTRER pour pour modifier le nom du poste. Faire Ctrl+C pour quitter le programme.
::set /p ma_saisie=Si le nom du poste est correct, tapez O (Oui), sinon tapez N (Non). Faire Ctrl+C pour quitter le programme.

if DEFINED ma_saisie goto selection_du_poste :: Si on appuie sur ENTRER seulement, ma_saisie n'est pas définie


:: +--COPIE-DES-FICHIERS-SUR-LE-POSTE---------------------------------------------+

echo(
echo Copie vers %POSTE%
echo ==================
echo(
xcopy E:\vers_autres\*.idx \\%POSTE%\d$\EXPANSIA\Histo\ /Y
xcopy E:\vers_autres\*.lgh \\%POSTE%\d$\EXPANSIA\Histo\ /Y

:: On fait les tests dans un r‚pertoire temporaire d:\test_bruno sur le poste
REM xcopy E:\vers_autres\*.idx \\%POSTE%\d$\test_bruno\ /Y
REM xcopy E:\vers_autres\*.lgh \\%POSTE%\d$\test_bruno\ /Y


:: +--FIN-DU-PROGRAMME-----------------------------------------------------------+

echo(
:: On fait une pause pour que la fenêtre reste affichée
echo Appuyer sur une touche pour quitter le programme.
pause>nul 
exit


