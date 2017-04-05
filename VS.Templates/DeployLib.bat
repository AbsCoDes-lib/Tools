@Echo off
setlocal enableextensions
setlocal enabledelayedexpansion

:: Ask user info about the project to create
:: Ex : MyProject and MY_PROJECT
set /p Project=What's your Project name :
set /p ProjectPreprocessor=Give a Preprocessor name :

:: Define local variables
set Template=AbscodesLibTemplate
set TemplatePreprocessor=ABSCODES_LIB_TEMPLATE
set "TemplateDir=%~dp0%Template%"
set "ProjectDir=%~dp0%Project%"

:: First make a copy of AbscodesTemplateLib folder
:: -----------------------------------------------
xcopy "%TemplateDir%\*.*" "%ProjectDir%\" /h/e/k/f/c

:: Rename folders
:: --------------
rename "%ProjectDir%\include\%Template%" "%Project%" 
rename "%ProjectDir%\src\%Template%" "%Project%" 

:: Rename files
:: ------------
for /r "%ProjectDir%" %%F in ("%Template%*.*") do (
    set "filename=%%~nxF"
    rename %%F "!filename:%Template%=%Project%!"
)

:: Find and replace into files
:: ---------------------------
::http://fart-it.sourceforge.net/
call FART -r "%ProjectDir%\*" %Template% %Project%
call FART -r "%ProjectDir%\*" %TemplatePreprocessor% %ProjectPreprocessor%

:: Generate new project GUID
for /F %%u IN ('POWERSHELL -COMMAND "$([guid]::NewGuid().ToString())"') do (
    call FART -r "%ProjectDir%\*" 00000000-0000-0000-0000-000000000000 %%u
)
:: Generate new filters GUID
for /F %%u IN ('POWERSHELL -COMMAND "$([guid]::NewGuid().ToString())"') do (
    call FART -r "%ProjectDir%\*" 10000000-0000-0000-0000-000000000000 %%u
)
for /F %%u IN ('POWERSHELL -COMMAND "$([guid]::NewGuid().ToString())"') do (
    call FART -r "%ProjectDir%\*" 20000000-0000-0000-0000-000000000000 %%u
)
for /F %%u IN ('POWERSHELL -COMMAND "$([guid]::NewGuid().ToString())"') do (
    call FART -r "%ProjectDir%\*" 30000000-0000-0000-0000-000000000000 %%u
)
for /F %%u IN ('POWERSHELL -COMMAND "$([guid]::NewGuid().ToString())"') do (
    call FART -r "%ProjectDir%\*" 40000000-0000-0000-0000-000000000000 %%u
)

