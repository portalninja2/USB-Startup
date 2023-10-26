mkdir Scripts\modules
@echo off
:Auswahlmenue
@title USB-Stick-Menue
cls
echo.
echo Treffe eine Auswahl
echo =================================
echo.
if exist Scripts\modules\backup.bat echo [B]BackUP Manager
echo [g]Get Modules
echo.

set asw=0
set /p asw="Bitte eine Auswahl treffen: "

if exist Scripts\modules\backup.bat if %asw%==b goto BackUP
if %asw%==g goto getModules
if %asw%==exit goto END
if %asw%==update goto update
if%asw%==rmodules goto rmodules

goto end

:getModules
curl --output Scripts\modules\modules-store.bat https://raw.githubusercontent.com/portalninja2/USB-Modules/main/get-modules.bat --ssl-no-revoke
start Scripts\modules\modules-store.bat
goto END

:BackUP
start Scripts\modules\backup.bat
goto END

:END
echo bye
exit

:update
del Scripts\modules\modules-store
curl --output update-file.bat https://raw.githubusercontent.com/portalninja2/USB-Modules/main/update-file.bat --ssl-no-revoke
start update-file.bat
end

:rmodules
del Scripts\modules\backup.bat
end
