REM Installation de Granta sur un poste client
REM Bruno Boissonnet
REM 28/10/2014

REM Copie le fichier Fra32.XML dans le dossier adequat
REM Afin d'avoir les informations "Point de Rassemblement",
REM "Matricule" etc ... dans l'onglet "Renseignements Personnels"
REM du porteur de badge.

set DOSSIER_DESTINATION="C:\sysmgrsql\progs\"
set FICHIER="Fra32.XML"


REM On se met dans le répertoire du script
pushd "%~dp0"

REM On crée le dossier de destination s'il n'existe pas (debug)
if not EXIST %DOSSIER_DESTINATION% (
	mkdir %DOSSIER_DESTINATION%
)

REM On copie le fichier dans le dossier
copy %FICHIER% %DOSSIER_DESTINATION%

REM On se remet dans le répertoire d'origine
popd