CLS REM On efface l'‚cran
@echo off
echo +-----------------------------------------------------------------------------+
echo ^| Fichier     : installation_automatique_approach.bat                         ^|
echo ^| Version     : 3.0                                                           ^|
echo ^| Auteur      : Bruno Boissonnet                                              ^|
echo ^| Date        : 30/10/2014                                                    ^|
echo ^| Description : Lance une installation automatique silencieuse de Approach.   ^|
echo ^|                                                                             ^|
echo ^| Remarques   : - Comme c'est une installation silencieuse, on ne voit rien.  ^|
echo ^|               Il faut donc laisser 5 à 6 min que l'installation se termine. ^|
echo ^|               - Installation pour tous les utilisateurs.                    ^|
echo ^|               - Répertoire d'installation : c:\lotus.                       ^|
echo ^|               - Utilisateur : EXPANSIA - Entreprise : EXPANSIA.             ^|
echo ^|               - Voir le fichier instuit.rsp pour plus d'explications.       ^|
echo +-----------------------------------------------------------------------------+
::echo(
::echo Faire Ctrl+C pour quitter le programme ou appuyer sur une touche pour continuer.

REM On fait une pause pour que la fenˆtre reste affich‚e
::pause>nul


REM +--DEBUT-DU-PROGRAMME---------------------------------------------------------+


REM On se place dans le répertoire du script qui est le répertoire
REM du fichier setup et du fichier instuit.rsp
REM %0 est le nom du fichier batch. ~dp renvoie le disque et le répertoire de l'argument spécifié.

pushd %~dp0

REM On lance l'installation automatisée avec le fichier de réponse

setup /v"/qn RSP=\"%~dp0\instsuit.rsp\""

:: revient dans le dossier initial
popd



REM +--FIN-DU-PROGRAMME-----------------------------------------------------------+
:END
echo(
REM On fait une pause pour que la fenˆtre reste affich‚e
echo Appuyer sur une touche pour quitter le programme.
pause>nul 
