@echo off & setlocal enableextensions

echo + Suppressions par extensions
echo +-------------------------------------------------------+

del /s /q /f /a:h *.suo
del /s /q /f /a:h Thumbs.db
del /s /f /q *.aps
del /s /f /q *.exp
del /s /f /q *.idb
del /s /f /q *.ilk
del /s /f /q *.ipch
del /s /f /q *.ncb
del /s /f /q *.obj
del /s /f /q *.pch
del /s /f /q *.pdb
del /s /f /q *.sbr
del /s /f /q *.sdf
del /s /f /q *.tlh
del /s /f /q *.tli
del /s /f /q *.user
del /s /f /q *.VC.db
del /s /f /q *.xdc

echo + Suppressions des répertoires bin, lib et obj
echo +-------------------------------------------------------+

for /d /r . %%d in (bin lib obj ipch TestResults) do @if exist "%%d" echo "%%d" && rd /s/q "%%d"

:: Fin
exit /b
