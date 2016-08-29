CLS REM On efface l'�cran
@echo off
echo +-----------------------------------------------------------------------------+
echo ^| Fichier     : installation_automatique_approach.bat                         ^|
echo ^| Version     : 3.0                                                           ^|
echo ^| Auteur      : Bruno Boissonnet                                              ^|
echo ^| Date        : 30/10/2014                                                    ^|
echo ^| Description : Lance une installation automatique silencieuse de Approach.   ^|
echo ^|                                                                             ^|
echo ^| Remarques   : - Comme c'est une installation silencieuse, on ne voit rien.  ^|
echo ^|               Il faut donc laisser 5 � 6 min que l'installation se termine. ^|
echo ^|               - Installation pour tous les utilisateurs.                    ^|
echo ^|               - R�pertoire d'installation : c:\lotus.                       ^|
echo ^|               - Utilisateur : EXPANSIA - Entreprise : EXPANSIA.             ^|
echo ^|               - Voir le fichier instuit.rsp pour plus d'explications.       ^|
echo +-----------------------------------------------------------------------------+
::echo(
::echo Faire Ctrl+C pour quitter le programme ou appuyer sur une touche pour continuer.

REM On fait une pause pour que la fen�tre reste affich�e
::pause>nul


REM +--DEBUT-DU-PROGRAMME---------------------------------------------------------+


REM On se place dans le r�pertoire du script qui est le r�pertoire
REM du fichier setup et du fichier instuit.rsp
REM %0 est le nom du fichier batch. ~dp renvoie le disque et le r�pertoire de l'argument sp�cifi�.

pushd %~dp0

REM On lance l'installation automatis�e avec le fichier de r�ponse

setup /v"/qn RSP=\"%~dp0\instsuit.rsp\""

:: revient dans le dossier initial
popd



REM +--FIN-DU-PROGRAMME-----------------------------------------------------------+
:END
echo(
REM On fait une pause pour que la fen�tre reste affich�e
echo Appuyer sur une touche pour quitter le programme.
pause>nul 
