@echo off

REM Description : Lance une installation automatique silencieuse de Approach
REM Auteur : Bruno Boissonnet
REM Date : 30/10/2014
REM Remarques :
REM   - Comme c'est une installation silencieuse, on ne voit rien.
REM     Il faut donc laisser 5 à 6 minutes que l'installation se termine.
REM   - Installation pour tous les utilisateurs.
REM   - Répertoire d'installation : c:\lotus.
REM   - Utilisateur : EXPANSIA.
REM   - Entreprise : EXPANSIA.
REM   - Voir le fichier instuit.rsp pour plus d'explications.
 

REM Change de disque si nécessaire
%~d0


REM On se place dans le répertoire du script qui est le répertoire
REM du fichier setup et du fichier instuit.rsp
REM %0 est le nom du fichier batch. ~dp renvoie le disque et le répertoire de l'argument spécifié.

cd "%~dp0"


REM On lance l'installation automatisée avec le fichier de réponse

setup /v"/qn RSP=\"%~dp0\instsuit.rsp\""