
REM Installation de Granta sur un poste client
REM Bruno Boissonnet
REM 28/10/2014

REM Copie le fichier Fra32.XML dans le dossier adequat
REM Afin d'avoir les informations "Point de Rassemblement",
REM "Matricule" etc ... dans l'onglet "Renseignements Personnels"
REM du porteur de badge.


echo %CD%
:: Change to the directory that this batch file is in 
:: NB: it must be invoked with a full path! 
for /f %%i in ("%0") do set curpath=%%~dpi 
cd /d %curpath%
copy Fra32.XML C:\sysmgrsql\progs\Fra32.XML