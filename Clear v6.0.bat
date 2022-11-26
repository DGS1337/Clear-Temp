@shift /0
@echo off
chcp 65001
cls

REM  --> Verifique as permissões.
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> Se o sinalizador de erro estiver definido, não temos admin.
if '%errorlevel%' NEQ '0' (
    echo.[39m %date%. %time%.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo               [31m[/] WARNING, %username%. É necessário executar como administrador!
	timeout 10 >nul
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
title Cleaner v6.0 (By DouG#1999)
cls
echo.
echo.
echo               [61mBASE LOADING...
timeout 1 >nul
echo.
echo.
echo               [61m[/] Bem vindo, %username%.
echo               [61m[/] %date%. %time%.
echo.
timeout 1 >nul
echo               [61m[/]  Iniciando...
timeout 1 >nul
echo.
cls
goto MENU
:MENU
cls
echo.
echo.
echo               [90m██████╗  █████╗ ██╗   ██╗ ██████╗          [92m  ███╗  ██████╗ ██████╗ ███████╗[0m 
echo               [90m██╔══██╗██╔══██╗██║   ██║██╔════╝          [92m ████║  ╚════██╗╚════██╗╚════██║[0m
echo               [90m██║  ██║██║  ██║██║   ██║██║  ██╗          [92m██╔██║   █████╔╝ █████╔╝    ██╔╝[0m
echo               [90m██║  ██║██║  ██║██║   ██║██║  ╚██╗         [92m╚═╝██║   ╚═══██╗ ╚═══██╗   ██╔╝ [0m
echo               [90m██████╔╝╚█████╔╝╚██████╔╝╚██████╔╝         [92m███████╗██████╔╝██████╔╝  ██╔╝  [0m
echo               [90m╚═════╝  ╚════╝  ╚═════╝  ╚═════╝          [92m╚══════╝╚═════╝ ╚═════╝   ╚═╝   [0m
echo.
echo.
echo.
echo.
echo.
echo                                    [32m1[0m - [32mCLEAN CACHE[0m                 [32m2[0m - [32mSHUTDOWN[0m
echo.
echo.
echo                                    [32m3[0m - [32mREGEDIT[0m                     [32m4[0m - [32mREMOVER APPS[0m
echo.
echo.
echo                                    [32m5[0m - [32mHIGH PRIORITY[0m               [32m6[0m - [32mWINDOWS TASKS[0m
echo.
echo.
REM echo                                    [32m7[0m - [32mNona Funcao[0m
echo.
echo.
echo.
echo.
set /p key=key: 
if %key%==1 goto CLEAN
if %key%==2 goto SHUTDOWNPC
if %key%==3 goto REGEDIT
if %key%==4 goto NAVEGADOR
if %key%==5 goto HIGH
if %key%==6 goto TASK
if %key%==7 goto OPCAO_INVALIDO
if %key%==8 goto OPCAO_INVALIDO
if %key%==9 goto OPCAO_INVALIDO
if %key%==10 goto OPCAO_INVALIDO


:CLEAN
cls
echo.
echo               [32m █████╗ ██╗     ███████╗ █████╗ ██████╗ [0m    [90m █████╗  █████╗  █████╗ ██╗  ██╗███████╗[0m 
echo               [32m██╔══██╗██║     ██╔════╝██╔══██╗██╔══██╗[0m    [90m██╔══██╗██╔══██╗██╔══██╗██║  ██║██╔════╝[0m
echo               [32m██║  ╚═╝██║     █████╗  ███████║██████╔╝[0m    [90m██║  ╚═╝███████║██║  ╚═╝███████║█████╗  [0m
echo               [32m██║  ██╗██║     ██╔══╝  ██╔══██║██╔══██╗[0m    [90m██║  ██╗██╔══██║██║  ██╗██╔══██║██╔══╝  [0m
echo               [32m╚█████╔╝███████╗███████╗██║  ██║██║  ██║[0m    [90m╚█████╔╝██║  ██║╚█████╔╝██║  ██║███████╗[0m
echo               [32m ╚════╝ ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝[0m    [90m ╚════╝ ╚═╝  ╚═╝ ╚════╝ ╚═╝  ╚═╝╚══════╝[0m
echo.                   
echo.
echo.
echo.
echo.
echo                                                     [90m10[0m - [38mCLEAN TEMP.[0m 
echo                                                     [90m11[0m - [38mCLEAN DISCORD.[0m 
echo                                                     [90m12[0m - [38mCLEAN REDE.[0m 
echo                                                     [90m0[0m  -  [38mVOLTAR AO MENU.[0m 
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p key=key: 
if %key%==10 goto TEMP
if %key%==11 goto CLEANDISCORD
if %key%==12 goto REDE
if %key%==0 goto MENU


:TEMP
cls

cls
del /s /f /q "%windir%\temp"\*.*
rd /s /q "%windir%\temp"
md "%windir%\temp"
del /s /f /q "%windir%\Prefetch"\*.*
rd /s /q "%windir%\Prefetch"
md "%"windir%\Prefetch"
del /s /f /q "%windir%\system32\dllcache"\*.*
rd /s /q "%windir%\system32\dllcache"
md "%windir%\system32\dllcache"
del /s /f /q "%temp%"\*.*
rd /s /q "%temp%"
md "%temp%"
del /s /f /q "%USERPROFILE%\Local Settings\History"\*.*
rd /s /q "%USERPROFILE%\Local Settings\History"
md "%USERPROFILE%\Local Settings\History"
del /s /f /q "%USERPROFILE%\Local Settings\Temporary Internet Files"\*.*
rd /s /q "%USERPROFILE%\Local Settings\Temporary Internet Files"
md "%USERPROFILE%\Local Settings\Temporary Internet Files"
del /s /f /q "%USERPROFILE%\Local Settings\Temp"\*.*
rd /s /q "%USERPROFILE%\Local Settings\Temp"
md "%USERPROFILE%\Local Settings\Temp"
del /s /f /q "%USERPROFILE%\Recent"\*.*
rd /s /q "%USERPROFILE%\Recent"
md "%USERPROFILE%\Recent"
del /s /f /q "%USERPROFILE%\Cookies"\*.*
rd /s /q "%USERPROFILE%\Cookies"
md "%USERPROFILE%\Cookies"
del /s /f /q "%windir%\SoftwareDistribution\Download"\*.*
rd /s /q "%windir%\SoftwareDistribution\Download"
md "%windir%\SoftwareDistribution\Download"


taskkill /F /IM "ccleaner64.exe"
taskkill /F /IM "ccleaner.exe"
REM ***************** BABO CLEAN Navegadores ******************
REM ******************** WINDOWS ********************

REM Apaga todas as pastas temporárias e arquivos temporários do usuário
takeown /A /R /D Y /F C:\Users\%USERNAME%\AppData\Local\Temp\
icacls C:\Users\%USERNAME%\AppData\Local\Temp\ /grant administradores:F /T /C
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Temp\
md C:\Users\%USERNAME%\AppData\Local\Temp\
del /s /f /q  c:\windows\Downloaded Program Files\*.*
del /s /f /q  c:\windows\Installer\*.*

REM Apaga os arquivos de \Windows\Temp
takeown /A /R /D Y /F C:\windows\temp
icacls C:\windows\temp /grant administradores:F /T /C
rmdir /q /s c:\windows\temp
md c:\windows\temp

REM Apaga arquivos de log
del c:\windows\logs\cbs\*.log
del C:\Windows\Logs\MoSetup\*.log
del C:\Windows\Panther\*.log /s /q
del C:\Windows\inf\*.log /s /q
del C:\Windows\logs\*.log /s /q
del C:\Windows\SoftwareDistribution\*.log /s /q
del C:\Windows\Microsoft.NET\*.log /s /q
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\WebCache\*.log /s /q
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\SettingSync\*.log /s /q
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Explorer\ThumbCacheToDelete\*.tmp /s /q
del C:\Users\%USERNAME%\AppData\Local\Microsoft\"Terminal Server Client"\Cache\*.bin /s /q
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\INetCache\

REM ******************** EDGE ********************
taskkill /F /IM "msedge.exe"
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\Cache\data*.
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\Cache\f*.
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\Cache\index.
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\Database\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\CacheStorage\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\ScriptCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\GrShaderCache\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\ShaderCache\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\Storage\ext\

del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\Cache\data*.
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\Cache\f*.
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\Cache\index.
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\"Service Worker"\Database\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\"Service Worker"\CacheStorage\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\"Service Worker"\ScriptCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\Storage\ext\

del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\Cache\data*.
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\Cache\f*.
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\Cache\index.
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\"Service Worker"\Database\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\"Service Worker"\CacheStorage\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\"Service Worker"\ScriptCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\Storage\ext\

REM ******************** FIREFOX ********************
taskkill /F /IM "firefox.exe"
REM define qual é a pasta Profile do usuário e apaga os arquivos temporários dali
set parentfolder=C:\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles\
for /f "tokens=*" %%a in ('"dir /b "%parentfolder%"|findstr ".*\.default-release""') do set folder=%%a
del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\cache2\entries\*.
del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\startupCache\*.bin
del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\startupCache\*.lz*
del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\cache2\index*.*
del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\startupCache\*.little
del C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\cache2\*.log /s /q

REM ******************** CHROME ********************
taskkill /F /IM "chrome.exe"
del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\Cache\data*.
del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\Cache\f*.
del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\Cache\index.
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\Database\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\CacheStorage\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\ScriptCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\GrShaderCache\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\ShaderCache\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\Storage\ext\

del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\Cache\data*.
del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\Cache\f*.
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\"Service Worker"\Database\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\"Service Worker"\CacheStorage\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\"Service Worker"\ScriptCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\Storage\ext\

del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\Cache\data*.
del C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\Cache\f*.
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\"Service Worker"\Database\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\"Service Worker"\CacheStorage\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\"Service Worker"\ScriptCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\Storage\ext\

REM ******************** BRAVE ********************
taskkill /F /IM "brave.exe"
del C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\Cache\Cache_Data\data*.
del C:\Users\%USERNAME%\AppData\Local\BraveSoftware\"User Data"\Default\Cache\Cache_Data\f*.
del C:\Users\%USERNAME%\AppData\Local\BraveSoftware\"User Data"\Default\Cache\Cache_Data\index.
rmdir /q /s C:\Users\DouG\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Service Worker"\Database\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Service Worker"\CacheStorage\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\GrShaderCache\GPUCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\ShaderCache\GPUCache\
echo.
cls
echo.
echo.
echo.
echo                                                     [32m [-] INICIANDO OUTRA LIMPEZA.
echo.
echo.
echo.
echo.
del /f /s /q %systemdrive%\*.tmp
echo                                                     [32m [-] CONCUINDO LIMPEZA 1/11.
echo.
del /f /s /q %systemdrive%\*.temp
echo                                                     [32m [-] CONCUINDO LIMPEZA 2/11.
echo.
del /f /s /q %systemdrive%\*.old
echo                                                     [32m [-] CONCUINDO LIMPEZA 3/11.
echo.
del /f /s /q %systemdrive%\*.gid
echo                                                     [32m [-] CONCUINDO LIMPEZA 4/11.
echo.
del /f /s /q %systemdrive%\*.fts
echo                                                     [32m [-] CONCUINDO LIMPEZA 5/11.
echo.
del /f /s /q %systemdrive%\*._mp
echo                                                     [32m [-] CONCUINDO LIMPEZA 6/11.
echo.
del /f /s /q %systemdrive%\*.log
echo                                                     [32m [-] CONCUINDO LIMPEZA 7/11.
echo.
del /f /s /q %systemdrive%\*.chk
echo                                                     [32m [-] CONCUINDO LIMPEZA 8/11.
echo.
del /f /s /q %systemdrive%\*.~mp
echo                                                     [32m [-] CONCUINDO LIMPEZA 9/11.
echo.
del /f /s /q %systemdrive%\recycled\*.*
echo                                                     [32m [-] CONCUINDO LIMPEZA 10/11.
echo.
del /f /s /q %windir%\*.bak
echo                                                     [32m [-] CONCUINDO LIMPEZA 11/11.
echo.
echo.
del /f /s /q %windir%\prefetch\*.* rd /s /q %windir%\temp & md %windir%\temp
cls
echo.
echo.
echo.
echo                                                     [32m [-] CACHE LIMPO COM SUCESSO.
timeout 3 >nul
goto CLEAN


:CLEANDISCORD
REM CLOSE DISCORD E CANARY
taskkill /F /IM "discord.exe"
taskkill /F /IM "discordcanary.exe"
taskkill /F /IM "discordptb.exe"
REM APAGAR CACHE DISCORD
takeown /A /R /D Y /F "C:\Users\%USERNAME%\AppData\Roaming\discord\"
icacls "C:\Users\%USERNAME%\AppData\Roaming\discord\Cache" /grant administradores:F /T /C
rmdir /q /s "C:\Users\%USERNAME%\AppData\Roaming\discord\Cache"
md "C:\Users\%USERNAME%\AppData\Roaming\discord\Cache"
icacls "C:\Users\%USERNAME%\AppData\Roaming\discord\GPUCache" /grant administradores:F /T /C
rmdir /q /s "C:\Users\%USERNAME%\AppData\Roaming\discord\GPUCache"
md "C:\Users\%USERNAME%\AppData\Roaming\discord\GPUCache"
REM APAGAR CACHE CANARY
takeown /A /R /D Y /F "C:\Users\%USERNAME%\AppData\Roaming\discordcanary\"
icacls "C:\Users\%USERNAME%\AppData\Roaming\discordcanary\Code Cache" /grant administradores:F /T /C
rmdir /q /s "C:\Users\%USERNAME%\AppData\Roaming\discordcanary\Code Cache"
md "C:\Users\%USERNAME%\AppData\Roaming\discordcanary\Code Cache"
REM APAGAR CACHE POWERCORD
takeown /A /R /D Y /F "C:\Users\%USERNAME%\powercord\.cache"
icacls "C:\Users\%USERNAME%\powercord\.cache" /grant administradores:F /T /C
rmdir /q /s "C:\Users\%USERNAME%\powercord\.cache"
md "C:\Users\%USERNAME%\powercord\.cache"
REM APAGAR CACHE PTB
takeown /A /R /D Y /F "C:\Users\%USERNAME%\AppData\Roaming\discordptb\"
icacls "C:\Users\%USERNAME%\AppData\Roaming\discordptb\Code Cache" /grant administradores:F /T /C
rmdir /q /s "C:\Users\%USERNAME%\AppData\Roaming\discordptb\Code Cache"
md "C:\Users\%USERNAME%\AppData\Roaming\discordptb\Code Cache"
REM Abrir Canary/Discord
C:\Users\%USERNAME%\AppData\Local\DiscordCanary\Update.exe --processStart DiscordCanary.exe
C:\Users\%USERNAME%\AppData\Local\Discord\Update.exe --processStart Discord.exe
C:\Users\%USERNAME%\AppData\Local\DiscordPTB\Update.exe --processStart DiscordPTB.exe
timeout 1 >nul
cls
echo.
echo.
echo                                                     [32m [-] CACHE LIMPO COM SUCESSO.
timeout 3 >nul
goto CLEAN


:REDE
cls
sfc /purgecache
sfc /cachesize=50
ipconfig /release
ipconfig /flushdns
netsh winsock reset all
netsh int 6to4 reset all
netsh int ipv4 reset all
netsh int ipv6 reset all
netsh int httpstunnel reset all
netsh int isatap reset all
netsh int portproxy reset all
netsh int tcp reset all
netsh int teredo reset all
NET STOP DNSCACHE
NET STOP DHCP
NET START DNSCACHE
NET START DHCP
ipconfig /registerdns
ipconfig /renew
arp -a -d
netsh interface ip delete arpcache
netsh interface ip delete destinationcache
nbtstat -R
nbtstat -RR
netsh int ip reset
netsh winsock reset catalog
timeout 1 >nul
cls
echo.
echo.
echo                                                     [32m [-] CACHE REDE LIMPO COM SUCESSO.
timeout 3 >nul
goto CLEAN







REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
:SHUTDOWNPC
cls
echo.
echo               [32m ██████╗██╗  ██╗██╗   ██╗████████╗██████╗  █████╗  ██╗       ██╗███╗  ██╗
echo               [32m██╔════╝██║  ██║██║   ██║╚══██╔══╝██╔══██╗██╔══██╗ ██║  ██╗  ██║████╗ ██║
echo               [32m╚█████╗ ███████║██║   ██║   ██║   ██║  ██║██║  ██║ ╚██╗████╗██╔╝██╔██╗██║
echo               [32m ╚═══██╗██╔══██║██║   ██║   ██║   ██║  ██║██║  ██║  ████╔═████║ ██║╚████║
echo               [32m██████╔╝██║  ██║╚██████╔╝   ██║   ██████╔╝╚█████╔╝  ╚██╔╝ ╚██╔╝ ██║ ╚███║
echo               [32m╚═════╝ ╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚═════╝  ╚════╝    ╚═╝   ╚═╝  ╚═╝  ╚══╝
echo.                   
echo.
echo.
echo.
echo.
echo                                                     [90m21[0m - [38mSHUTDOWN PC 1h.[0m
echo                                                     [90m22[0m - [38mSHUTDOWN PC 2h.[0m
echo                                                     [90m23[0m - [38mCANCELAR SHUTDOWN.[0m
echo                                                     [90m0[0m - [38mVOLTAR AO MENU.[0m 
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p key=key: 
if %key%==21 goto 1H
if %key%==22 goto 2H
if %key%==23 goto CANCELARSHUTDOWN
if %key%==0 goto MENU

:1H
cls
shutdown -a
shutdown -s -t 3600
timeout 1 >nul
cls
echo.
echo.
echo                                                     [32m [-] DESLIGAMENTO EM 1H.
timeout 2 >nul
goto MENU


:2H
shutdown -a
shutdown -s -t 7200
timeout 1 >nul
cls
echo.
echo.
echo                                                     [32m [-] DESLIGAMENTO EM 2H.
timeout 2 >nul
goto MENU


:CANCELARSHUTDOWN
shutdown -a
timeout 1 >nul
cls
echo.
echo.
echo                                                     [32m [-] SHUTDOWN CANCELADO!
timeout 2 >nul
goto MENU










REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
:REGEDIT
cls
echo.
echo               [32m██████╗ ███████╗ ██████╗ ███████╗██████╗ ██╗████████╗[0m     
echo               [32m██╔══██╗██╔════╝██╔════╝ ██╔════╝██╔══██╗██║╚══██╔══╝[0m     
echo               [32m██████╔╝█████╗  ██║  ██╗ █████╗  ██║  ██║██║   ██║   [0m     
echo               [32m██╔══██╗██╔══╝  ██║  ╚██╗██╔══╝  ██║  ██║██║   ██║   [0m
echo               [32m██║  ██║███████╗╚██████╔╝███████╗██████╔╝██║   ██║   [0m     
echo               [32m╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚══════╝╚═════╝ ╚═╝   ╚═╝   [0m     
echo.                   
echo.
echo.
echo.
echo.
echo                                                     [39m31[0m - [38m GPU PRIORIDADE[0m
echo                                                     [39m32[0m - [38m TECLADO SEM DELAY[0m
echo                                                     [39m33[0m - [38m REMOVER TELEMATRIA E COLETA DE DADOS[0m
echo                                                     [39m34[0m - [38m RESTAURAR TUDO[0m
echo                                                     [39m0[0m  - [38mVOLTAR AO MENU.[0m 
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p key=key: 
if %key%==31 goto REGEDITGPU
if %key%==32 goto KEYBOARD
if %key%==33 goto COLETEDEDADOS
if %key%==34 goto RESTAURARCOLETEDEDADOS
if %key%==0 goto MENU

:REGEDITGPU
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD  /d "8" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD  /d "6" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f
echo.
echo.
echo                                                     [90m61[0m - [38m REGEDIT APLICADO COM SUCESSO.
timeout 3 >nul
goto REGEDIT


:KEYBOARD
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "AutoRepeatDelay" /t REG_SZ /d "210" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "AutoRepeatRate" /t REG_SZ /d "10" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "BounceTime" /t REG_SZ /d "0" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "DelayBeforeAcceptance" /t REG_SZ /d "0" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d "27" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "Last BounceKey Setting" /t REG_DWORD /d "00000000" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Delay" /t REG_DWORD /d "00000000" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Repeat" /t REG_DWORD /d "00000000" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Wait" /t REG_DWORD /d "1000" /f
echo.
echo.
echo                                                     [90m61[0m - [38m REGEDIT APLICADO COM SUCESSO.
timeout 3 >nul
goto REGEDIT


:COLETEDEDADOS
@rem *** Remover telemetria e coleta de dados ***
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v DontOfferThroughWUAU /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v "EnableActiveProbing" /t REG_DWORD /d 0 /f
echo.
echo.
echo                                                     [90m61[0m - [38m REGEDIT APLICADO COM SUCESSO.
timeout 3 >nul
goto REGEDIT


:RESTAURARCOLETEDEDADOS
@rem *** Remover telemetria e coleta de dados ***
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v DontOfferThroughWUAU /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v "EnableActiveProbing" /t REG_DWORD /d 1 /f
:: reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /f
echo.
echo.
echo                                                     [90m61[0m - [38m REGEDIT APLICADO COM SUCESSO.
timeout 3 >nul
goto REGEDIT








REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
:NAVEGADOR
cls
echo.
echo               [32m██╗   ██╗███╗  ██╗██╗███╗  ██╗ ██████╗████████╗ █████╗ ██╗     ██╗     [0m     
echo               [32m██║   ██║████╗ ██║██║████╗ ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     [0m     
echo               [32m██║   ██║██╔██╗██║██║██╔██╗██║╚█████╗    ██║   ███████║██║     ██║     [0m     
echo               [32m██║   ██║██║╚████║██║██║╚████║ ╚═══██╗   ██║   ██╔══██║██║     ██║     [0m
echo               [32m╚██████╔╝██║ ╚███║██║██║ ╚███║██████╔╝   ██║   ██║  ██║███████╗███████╗[0m     
echo               [32m ╚═════╝ ╚═╝  ╚══╝╚═╝╚═╝  ╚══╝╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝[0m     
echo.                   
echo.
echo.
echo.
echo.
echo                                                     [39m42[0m - [38m REMOVER APPS INÚTEIS[0m
echo                                                     [39m0[0m  - [38mVOLTAR AO MENU.[0m 
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p key=key: 
if %key%==42 goto REMOVERAPPS
if %key%==0 goto MENU


:REMOVERAPPS
cls
PowerShell -Command "Get-AppxPackage *3DBuilder* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Getstarted* | Remove-AppxPackage"
REM PowerShell -Command "Get-AppxPackage *WindowsAlarms* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsCamera* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *bing* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *OneNote* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsPhone* | Remove-AppxPackage"
REM PowerShell -Command "Get-AppxPackage *photos* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *SkypeApp* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *solit* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsSoundRecorder* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *zune* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsMaps* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Sway* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *CommsPhone* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *ConnectivityStore* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.Messaging* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Facebook* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Twitter* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Drawboard PDF* | Remove-AppxPackage"
echo.
echo.
echo                                                     [32m [-] PROGRAMAS REMOVIDOS COM SUCESSO.
timeout 3 >nul
goto MENU






REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

:HIGH
cls
echo.
echo               [32m██╗  ██╗██╗ ██████╗ ██╗  ██╗[0m    [90m██████╗ ██████╗ ██╗ █████╗ ██████╗ ██╗████████╗██╗   ██╗[0m 
echo               [32m██║  ██║██║██╔════╝ ██║  ██║[0m    [90m██╔══██╗██╔══██╗██║██╔══██╗██╔══██╗██║╚══██╔══╝╚██╗ ██╔╝[0m
echo               [32m███████║██║██║  ██╗ ███████║[0m    [90m██████╔╝██████╔╝██║██║  ██║██████╔╝██║   ██║    ╚████╔╝ [0m
echo               [32m██╔══██║██║██║  ╚██╗██╔══██║[0m    [90m██╔═══╝ ██╔══██╗██║██║  ██║██╔══██╗██║   ██║     ╚██╔╝  [0m
echo               [32m██║  ██║██║╚██████╔╝██║  ██║[0m    [90m██║     ██║  ██║██║╚█████╔╝██║  ██║██║   ██║      ██║   [0m
echo               [32m╚═╝  ╚═╝╚═╝ ╚═════╝ ╚═╝  ╚═╝[0m    [90m╚═╝     ╚═╝  ╚═╝╚═╝ ╚════╝ ╚═╝  ╚═╝╚═╝   ╚═╝      ╚═╝   [0m
echo.                   
echo.
echo.
echo.
echo.
echo                [90m51[0m - [38m PARA VER LISTA DE JOGOS COM PRIORIDADE ALTA.[0m
echo                [90m52[0m - [38m INICIAR.[0m
echo                [90m53[0m - [38m RESTAURAR.[0m
echo                [90m0[0m  - [38m VOLTAR AO MENU.[0m 
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p key=key: 
if %key%==51 goto JOGOS
if %key%==52 goto HIGHINICIAR
if %key%==53 goto RESTAURAR
if %key%==0 goto MENU

:JOGOS
cls
echo.
echo.
@echo off
echo.
echo Cry of Fear
echo Counter-Strike: Global Offensive
echo DarkSoulsIII
echo DaysGone
echo Dead by Daylight
echo Escape the Ayuwoki
echo Ghost Recon Wildlands
echo GTA V
echo GTFO
echo Minecraft
echo KingdomCome Deliverance
echo Resident Evil 2 Remake
echo Resident Evil 3 Remake
echo Resident Evil 7 Biohazard
echo Resident Evil 8 Village
echo Rocket League
echo Skyrim Special Edition
echo Need for Speed Most Wanted 2005
echo TearDown
echo Transformice
echo The Division 1
echo The Battle for Wesnoth
echo The Witcher 3
echo World War Z
echo Apsulov End of Gods
echo Valorant
echo FiveM
echo Brawlhalla
echo.
color 04
echo Games Total: 28
echo.
echo                                                     [32m [-] VOLTANDO AO MENU EM 5 SEGUNDOS....
timeout 5 >nul
goto HIGH


:HIGHINICIAR
echo.
echo.
cls
@echo on
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cof.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csgo.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DarkSoulsIII.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DaysGone.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DeadByDaylight-Win64-Shipping.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Escape the Ayuwoki.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GRW.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GTA5.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\gtfo.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\javaw.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\KingdomCome.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re2.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re3.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re7.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re8.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RocketLeague.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SkyrimSE.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\speed.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\teardown.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\thedivision.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wesnoth.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\witcher3.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wwzRetailEgs.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Project_C-Win64-Shipping.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\valorant.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Transformice.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM_b2372_GTAProcess.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BrawlhallaGame.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
@echo off
echo.
echo.
echo                                                     [32m [-] PRIORIDADE DEFINIDADES COMO ALTA.
echo                                                     [32m [-] REINICIE SEU COMPUTADOR.
echo.
timeout 6 >nul
goto MENU


:RESTAURAR
@echo on
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cof.exe\PerfOptions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csgo.exe\PerfOptions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DarkSoulsIII.exe\PerfOptions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DaysGone.exe\PerfOptions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DeadByDaylight-Win64-Shipping.exe\PerfOptions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Escape the Ayuwoki.exe\PerfOptions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GRW.exe\PerfOptions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GTA5.exe\PerfOptions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\gtfo.exe\PerfOptions"  /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\javaw.exe\PerfOptions"  /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\KingdomCome.exe\PerfOptions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re2.exe\PerfOptions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re3.exe\PerfOptions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re7.exe\PerfOptions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re8.exe\PerfOptions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RocketLeague.exe\PerfOptions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SkyrimSE.exe\PerfOptions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\speed.exe\PerfOptions"/f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\teardown.exe\PerfOptions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\thedivision.exe\PerfOptions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wesnoth.exe\PerfOptions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\witcher3.exe\PerfOptions"  /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wwzRetailEgs.exe\PerfOptions"/f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Project_C-Win64-Shipping.exe\PerfOptions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\valorant.exe\PerfOptions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Transformice.exe\PerfOptions" /v "CpuPriorityClass" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM.exe\PerfOptions" /v "CpuPriorityClass" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM_b2372_GTAProcess.exe\PerfOptions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BrawlhallaGame.exe\PerfOptions" /f
echo.
echo.
echo                                                     [32m [-] PRIORIDADE ALTA DELETADOS...
echo.
echo                                                     [32m [-] REINICIE SEU COMPUTADOR.
echo.
timeout 6 >nul
goto MENU









REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
:TASK
cls
echo.
echo               [32m ██╗       ██╗██╗███╗  ██╗██████╗  █████╗  ██╗       ██╗ ██████╗    [90m████████╗ █████╗  ██████╗██╗  ██╗
echo               [32m ██║  ██╗  ██║██║████╗ ██║██╔══██╗██╔══██╗ ██║  ██╗  ██║██╔════╝    [90m╚══██╔══╝██╔══██╗██╔════╝██║ ██╔╝
echo               [32m ╚██╗████╗██╔╝██║██╔██╗██║██║  ██║██║  ██║ ╚██╗████╗██╔╝╚█████╗     [90m   ██║   ███████║╚█████╗ █████═╝ 
echo               [32m  ████╔═████║ ██║██║╚████║██║  ██║██║  ██║  ████╔═████║  ╚═══██╗    [90m   ██║   ██╔══██║ ╚═══██╗██╔═██╗ 
echo               [32m  ╚██╔╝ ╚██╔╝ ██║██║ ╚███║██████╔╝╚█████╔╝  ╚██╔╝ ╚██╔╝ ██████╔╝    [90m   ██║   ██║  ██║██████╔╝██║ ╚██╗
echo               [32m   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚══╝╚═════╝  ╚════╝    ╚═╝   ╚═╝  ╚═════╝     [90m   ╚═╝   ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝
echo.                   
echo.
echo.
echo.
echo.
echo                                                     [90m61[0m - [38m VER LISTA[0m
echo                                                     [90m62[0m - [38m DESABILITAR TUDO.[0m
echo                                                     [90m63[0m - [38m REATIVAR.[0m 
echo                                                     [90m0[0m  - [38m VOLTAR AO MENU.[0m 
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p key=key: 
if %key%==61 goto TASKLIST
if %key%==62 goto TASKDESATIVAR
if %key%==63 goto TASKREATIVAR
if %key%==0 goto MENU

:TASKLIST
echo.
echo.
@echo off
echo Quantidade total de tarefas desnecessarias a serem desabilitadas = 82.
echo Para ver uma descricao dessas tarefas, pressione as teclas Windows e R ao mesmo tempo.
echo Digite taskschd.msc e pressione enter.
echo.
echo.
echo Tarefas desnecessarias: (Total 82)
echo.
echo.
echo "Driver Easy Scheduled Scan"
echo "ModifyLinkUpdate"
echo "SoftMakerUpdater"
echo "StartCN"
echo "StartDVR"
echo Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser
echo Microsoft\Windows\Application Experience\PcaPatchDbTask
echo Microsoft\Windows\Application Experience\ProgramDataUpdater
echo Microsoft\Windows\Application Experience\StartupAppTask
echo Microsoft\Windows\Autochk\Proxy
echo Microsoft\Windows\Customer Experience Improvement Program\Consolidator
echo Microsoft\Windows\Customer Experience Improvement Program\UsbCeip
echo Microsoft\Windows\Defrag\ScheduledDefrag
echo Microsoft\Windows\Device Information\Device
echo Microsoft\Windows\Device Information\Device User
echo Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner
echo Microsoft\Windows\Diagnosis\Scheduled
echo Microsoft\Windows\DiskCleanup\SilentCleanup
echo Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector
echo Microsoft\Windows\DiskFootprint\Diagnostics
echo Microsoft\Windows\DiskFootprint\StorageSense
echo Microsoft\Windows\DUSM\dusmtask
echo Microsoft\Windows\Feedback\Siuf\DmClient
echo Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload
echo Microsoft\Windows\FileHistory\File History (maintenance mode)
echo Microsoft\Windows\Flighting\FeatureConfig\ReconcileFeatures
echo Microsoft\Windows\Flighting\FeatureConfig\UsageDataFlushing
echo Microsoft\Windows\Flighting\FeatureConfig\UsageDataReporting
echo Microsoft\Windows\Flighting\OneSettings\RefreshCache
echo Microsoft\Windows\Input\LocalUserSyncDataAvailable
echo Microsoft\Windows\Input\MouseSyncDataAvailable
echo Microsoft\Windows\Input\PenSyncDataAvailable
echo Microsoft\Windows\Input\TouchpadSyncDataAvailable
echo Microsoft\Windows\International\Synchronize Language Settings
echo Microsoft\Windows\LanguageComponentsInstaller\Installation
echo Microsoft\Windows\LanguageComponentsInstaller\ReconcileLanguageResources
echo Microsoft\Windows\LanguageComponentsInstaller\Uninstallation
echo Microsoft\Windows\License Manager\TempSignedLicenseExchange
echo Microsoft\Windows\License Manager\TempSignedLicenseExchange
echo Microsoft\Windows\Management\Provisioning\Cellular
echo Microsoft\Windows\Management\Provisioning\Logon
echo Microsoft\Windows\Maintenance\WinSAT
echo Microsoft\Windows\Maps\MapsToastTask
echo Microsoft\Windows\Maps\MapsUpdateTask
echo Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parserd
echo Microsoft\Windows\MUI\LPRemove
echo Microsoft\Windows\NetTrace\GatherNetworkInfo
echo Microsoft\Windows\PI\Sqm-Tasks
echo Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem
echo Microsoft\Windows\PushToInstall\Registration
echo Microsoft\Windows\Ras\MobilityManager
echo Microsoft\Windows\RecoveryEnvironment\VerifyWinRE
echo Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask
echo Microsoft\Windows\Servicing\StartComponentCleanup
echo Microsoft\Windows\SettingSync\NetworkStateChangeTask
echo Microsoft\Windows\SpacePort\SpaceAgentTask
echo Microsoft\Windows\SpacePort\SpaceManagerTask
echo Microsoft\Windows\Speech\SpeechModelDownloadTask
echo Microsoft\Windows\Storage Tiers Management\Storage Tiers Management Initialization
echo Microsoft\Windows\Sysmain\ResPriStaticDbSync
echo Microsoft\Windows\Sysmain\WsSwapAssessmentTask
echo Microsoft\Windows\Task Manager\Interactive
echo Microsoft\Windows\Time Synchronization\ForceSynchronizeTime
echo Microsoft\Windows\Time Synchronization\SynchronizeTime
echo Microsoft\Windows\Time Zone\SynchronizeTimeZone
echo Microsoft\Windows\TPM\Tpm-HASCertRetr
echo Microsoft\Windows\TPM\Tpm-Maintenance
echo Microsoft\Windows\UPnP\UPnPHostConfig
echo Microsoft\Windows\User Profile Service\HiveUploadTask
echo Microsoft\Windows\WDI\ResolutionHost
echo Microsoft\Windows\Windows Filtering Platform\BfeOnServiceStartTypeChange
echo Microsoft\Windows\WOF\WIM-Hash-Management
echo Microsoft\Windows\WOF\WIM-Hash-Validation
echo Microsoft\Windows\Work Folders\Work Folders Logon Synchronization
echo Microsoft\Windows\Work Folders\Work Folders Maintenance Work
echo Microsoft\Windows\Workplace Join\Automatic-Device-Join
echo Microsoft\Windows\WwanSvc\NotificationTask
echo Microsoft\Windows\WwanSvc\OobeDiscovery
echo.
echo.
echo Update and Store Tasks: (Total 12)
echo.
echo.
echo Microsoft\Windows\InstallService\ScanForUpdates
echo Microsoft\Windows\InstallService\ScanForUpdatesAsUser
echo Microsoft\Windows\InstallService\SmartRetry
echo Microsoft\Windows\InstallService\WakeUpAndContinueUpdates
echo Microsoft\Windows\InstallService\WakeUpAndScanForUpdates
echo Microsoft\Windows\UpdateOrchestrator\Report policies
echo Microsoft\Windows\UpdateOrchestrator\Schedule Scan
echo Microsoft\Windows\UpdateOrchestrator\Schedule Scan Static Task
echo Microsoft\Windows\UpdateOrchestrator\UpdateModelTask
echo Microsoft\Windows\UpdateOrchestrator\USO_UxBroker
echo Microsoft\Windows\WaaSMedic\PerformRemediation
echo Microsoft\Windows\WindowsUpdate\Scheduled Start
echo.
echo.
echo Tarefa de impressora e Wi-Fis: (Total 4)
echo.
echo.
echo Microsoft\Windows\Printing\EduPrintProv
echo Microsoft\Windows\WlanSvc\CDSSync
echo Microsoft\Windows\WCM\WiFiTask
echo Microsoft\Windows\NlaSvc\WiFiTask
echo.
echo.
echo                                                     [32m [-] TODAS TAREFAS LISTADAS ACIMA.
echo.
echo                                                     [32m [-] VOLTANDO AO MENU EM 7 SEGUNDOS...
timeout 7 >nul
goto TASK


:TASKDESATIVAR
echo.
echo.
@echo on
schtasks /DELETE /TN "AMDInstallLauncher" /f
schtasks /DELETE /TN "AMDLinkUpdate" /f
schtasks /DELETE /TN "AMDRyzenMasterSDKTask" /f
schtasks /DELETE /TN "Driver Easy Scheduled Scan" /f
schtasks /DELETE /TN "ModifyLinkUpdate" /f
schtasks /DELETE /TN "SoftMakerUpdater" /f
schtasks /DELETE /TN "StartCN" /f
schtasks /DELETE /TN "StartDVR" /f
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\PcaPatchDbTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
schtasks /Change /TN "Microsoft\Windows\Defrag\ScheduledDefrag" /Disable
schtasks /Change /TN "Microsoft\Windows\Device Information\Device" /Disable
schtasks /Change /TN "Microsoft\Windows\Device Information\Device User" /Disable
schtasks /Change /TN "Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner" /Disable
schtasks /Change /TN "Microsoft\Windows\Diagnosis\Scheduled" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskCleanup\SilentCleanup" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskFootprint\StorageSense" /Disable
schtasks /Change /TN "Microsoft\Windows\DUSM\dusmtask" /Disable
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /Disable
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /Disable
schtasks /Change /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /Disable
schtasks /Change /TN "Microsoft\Windows\Flighting\FeatureConfig\ReconcileFeatures" /Disable
schtasks /Change /TN "Microsoft\Windows\Flighting\FeatureConfig\UsageDataFlushing" /Disable
schtasks /Change /TN "Microsoft\Windows\Flighting\FeatureConfig\UsageDataReporting" /Disable
schtasks /Change /TN "Microsoft\Windows\Flighting\OneSettings\RefreshCache" /Disable
schtasks /Change /TN "Microsoft\Windows\Input\LocalUserSyncDataAvailable" /Disable
schtasks /Change /TN "Microsoft\Windows\Input\MouseSyncDataAvailable" /Disable
schtasks /Change /TN "Microsoft\Windows\Input\PenSyncDataAvailable" /Disable
schtasks /Change /TN "Microsoft\Windows\Input\TouchpadSyncDataAvailable" /Disable
schtasks /Change /TN "Microsoft\Windows\International\Synchronize Language Settings" /Disable
schtasks /Change /TN "Microsoft\Windows\LanguageComponentsInstaller\Installation" /Disable
schtasks /Change /TN "Microsoft\Windows\LanguageComponentsInstaller\ReconcileLanguageResources" /Disable
schtasks /Change /TN "Microsoft\Windows\LanguageComponentsInstaller\Uninstallation" /Disable
schtasks /Change /TN "Microsoft\Windows\License Manager\TempSignedLicenseExchange" /Disable
schtasks /Change /TN "Microsoft\Windows\License Manager\TempSignedLicenseExchange" /Disable
schtasks /Change /TN "Microsoft\Windows\Management\Provisioning\Cellular" /Disable
schtasks /Change /TN "Microsoft\Windows\Management\Provisioning\Logon" /Disable
schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable
schtasks /Change /TN "Microsoft\Windows\Maps\MapsToastTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Maps\MapsUpdateTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser" /Disable
schtasks /Change /TN "Microsoft\Windows\MUI\LPRemove" /Disable
schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable
schtasks /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /Disable
schtasks /Change /TN "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Disable
schtasks /Change /TN "Microsoft\Windows\PushToInstall\Registration" /Disable
schtasks /Change /TN "Microsoft\Windows\Ras\MobilityManager" /Disable
schtasks /Change /TN "Microsoft\Windows\RecoveryEnvironment\VerifyWinRE" /Disable
schtasks /Change /TN "Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Servicing\StartComponentCleanup" /Disable
schtasks /Change /TN "Microsoft\Windows\SettingSync\NetworkStateChangeTask" /Disable
schtasks /Change /TN "Microsoft\Windows\SpacePort\SpaceAgentTask" /Disable
schtasks /Change /TN "Microsoft\Windows\SpacePort\SpaceManagerTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Speech\SpeechModelDownloadTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Storage Tiers Management\Storage Tiers Management Initialization" /Disable
schtasks /Change /TN "Microsoft\Windows\Sysmain\ResPriStaticDbSync" /Disable
schtasks /Change /TN "Microsoft\Windows\Sysmain\WsSwapAssessmentTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Task Manager\Interactive" /Disable
schtasks /Change /TN "Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" /Disable
schtasks /Change /TN "Microsoft\Windows\Time Synchronization\SynchronizeTime" /Disable
schtasks /Change /TN "Microsoft\Windows\Time Zone\SynchronizeTimeZone" /Disable
schtasks /Change /TN "Microsoft\Windows\TPM\Tpm-HASCertRetr" /Disable
schtasks /Change /TN "Microsoft\Windows\TPM\Tpm-Maintenance" /Disable
schtasks /Change /TN "Microsoft\Windows\UPnP\UPnPHostConfig" /Disable
schtasks /Change /TN "Microsoft\Windows\User Profile Service\HiveUploadTask" /Disable
schtasks /Change /TN "Microsoft\Windows\WDI\ResolutionHost" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Filtering Platform\BfeOnServiceStartTypeChange" /Disable
schtasks /Change /TN "Microsoft\Windows\WOF\WIM-Hash-Management" /Disable
schtasks /Change /TN "Microsoft\Windows\WOF\WIM-Hash-Validation" /Disable
schtasks /Change /TN "Microsoft\Windows\Work Folders\Work Folders Logon Synchronization" /Disable
schtasks /Change /TN "Microsoft\Windows\Work Folders\Work Folders Maintenance Work" /Disable
schtasks /Change /TN "Microsoft\Windows\Workplace Join\Automatic-Device-Join" /Disable
schtasks /Change /TN "Microsoft\Windows\WwanSvc\NotificationTask" /Disable
schtasks /Change /TN "Microsoft\Windows\WwanSvc\OobeDiscovery" /Disable
schtasks /Change /Disable /TN "Microsoft\Windows\InstallService\ScanForUpdates"
schtasks /Change /Disable /TN "Microsoft\Windows\InstallService\ScanForUpdatesAsUser"
schtasks /Change /Disable /TN "Microsoft\Windows\InstallService\SmartRetry"
schtasks /Change /Disable /TN "Microsoft\Windows\InstallService\WakeUpAndContinueUpdates"
schtasks /Change /Disable /TN "Microsoft\Windows\InstallService\WakeUpAndScanForUpdates"
schtasks /Change /Disable /TN "Microsoft\Windows\UpdateOrchestrator\Report policies"
schtasks /Change /Disable /TN "Microsoft\Windows\UpdateOrchestrator\Schedule Scan"
schtasks /Change /Disable /TN "Microsoft\Windows\UpdateOrchestrator\Schedule Scan Static Task"
schtasks /Change /Disable /TN "Microsoft\Windows\UpdateOrchestrator\UpdateModelTask"
schtasks /Change /Disable /TN "Microsoft\Windows\UpdateOrchestrator\USO_UxBroker"
schtasks /Change /Disable /TN "Microsoft\Windows\WaaSMedic\PerformRemediation"
schtasks /Change /Disable /TN "Microsoft\Windows\WindowsUpdate\Scheduled Start"
schtasks /Change /TN "Microsoft\Windows\Printing\EduPrintProv" /Disable
schtasks /Change /TN "Microsoft\Windows\WlanSvc\CDSSync" /Disable
schtasks /Change /TN "Microsoft\Windows\WCM\WiFiTask" /Disable
schtasks /Change /TN "Microsoft\Windows\NlaSvc\WiFiTask" /Disable
REM *** [Desativar] Ajustes de TAREFAS AGENDADAS ***
schtasks /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /Disable
@echo off
echo.
echo.
echo.
echo                                                     [32m [-] TASK DESATIVADAS COM SUCESSO.
echo. 
echo                                                     [32m [-] REINICIE SEU COMPUTADOR.
echo.
echo                                                     [32m [-] VOLTANDO AO MENU EM 5 SEGUNDOS...
timeout 5 >nul
goto TASK

:TASKREATIVAR
echo.
echo.
@echo on
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Enable
schtasks /Change /TN "Microsoft\Windows\Application Experience\PcaPatchDbTask" /Enable
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Enable
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Enable
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Enable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Enable
schtasks /Change /TN "Microsoft\Windows\Defrag\ScheduledDefrag" /Enable
schtasks /Change /TN "Microsoft\Windows\Device Information\Device" /Enable
schtasks /Change /TN "Microsoft\Windows\Device Information\Device User" /Enable
schtasks /Change /TN "Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner" /Enable
schtasks /Change /TN "Microsoft\Windows\Diagnosis\Scheduled" /Enable
schtasks /Change /TN "Microsoft\Windows\DiskCleanup\SilentCleanup" /Enable
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Enable
schtasks /Change /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /Enable
schtasks /Change /TN "Microsoft\Windows\DiskFootprint\StorageSense" /Enable
schtasks /Change /TN "Microsoft\Windows\DUSM\dusmtask" /Enable
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /Enable
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /Enable
schtasks /Change /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /Enable
schtasks /Change /TN "Microsoft\Windows\Flighting\FeatureConfig\ReconcileFeatures" /Enable
schtasks /Change /TN "Microsoft\Windows\Flighting\FeatureConfig\UsageDataFlushing" /Enable
schtasks /Change /TN "Microsoft\Windows\Flighting\FeatureConfig\UsageDataReporting" /Enable
schtasks /Change /TN "Microsoft\Windows\Flighting\OneSettings\RefreshCache" /Enable
schtasks /Change /TN "Microsoft\Windows\Input\LocalUserSyncDataAvailable" /Enable
schtasks /Change /TN "Microsoft\Windows\Input\MouseSyncDataAvailable" /Enable
schtasks /Change /TN "Microsoft\Windows\Input\PenSyncDataAvailable" /Enable
schtasks /Change /TN "Microsoft\Windows\Input\TouchpadSyncDataAvailable" /Enable
schtasks /Change /TN "Microsoft\Windows\International\Synchronize Language Settings" /Enable
schtasks /Change /TN "Microsoft\Windows\LanguageComponentsInstaller\Installation" /Enable
schtasks /Change /TN "Microsoft\Windows\LanguageComponentsInstaller\ReconcileLanguageResources" /Enable
schtasks /Change /TN "Microsoft\Windows\LanguageComponentsInstaller\Uninstallation" /Enable
schtasks /Change /TN "Microsoft\Windows\License Manager\TempSignedLicenseExchange" /Enable
schtasks /Change /TN "Microsoft\Windows\License Manager\TempSignedLicenseExchange" /Enable
schtasks /Change /TN "Microsoft\Windows\Management\Provisioning\Cellular" /Enable
schtasks /Change /TN "Microsoft\Windows\Management\Provisioning\Logon" /Enable
schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Enable
schtasks /Change /TN "Microsoft\Windows\Maps\MapsToastTask" /Enable
schtasks /Change /TN "Microsoft\Windows\Maps\MapsUpdateTask" /Enable
schtasks /Change /TN "Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser" /Enable
schtasks /Change /TN "Microsoft\Windows\MUI\LPRemove" /Enable
schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Enable
schtasks /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /Enable
schtasks /Change /TN "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Enable
schtasks /Change /TN "Microsoft\Windows\PushToInstall\Registration" /Enable
schtasks /Change /TN "Microsoft\Windows\Ras\MobilityManager" /Enable
schtasks /Change /TN "Microsoft\Windows\RecoveryEnvironment\VerifyWinRE" /Enable
schtasks /Change /TN "Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask" /Enable
schtasks /Change /TN "Microsoft\Windows\Servicing\StartComponentCleanup" /Enable
schtasks /Change /TN "Microsoft\Windows\SettingSync\NetworkStateChangeTask" /Enable
schtasks /Change /TN "Microsoft\Windows\SpacePort\SpaceAgentTask" /Enable
schtasks /Change /TN "Microsoft\Windows\SpacePort\SpaceManagerTask" /Enable
schtasks /Change /TN "Microsoft\Windows\Speech\SpeechModelDownloadTask" /Enable
schtasks /Change /TN "Microsoft\Windows\Storage Tiers Management\Storage Tiers Management Initialization" /Enable
schtasks /Change /TN "Microsoft\Windows\Sysmain\ResPriStaticDbSync" /Enable
schtasks /Change /TN "Microsoft\Windows\Sysmain\WsSwapAssessmentTask" /Enable
schtasks /Change /TN "Microsoft\Windows\Task Manager\Interactive" /Enable
schtasks /Change /TN "Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" /Enable
schtasks /Change /TN "Microsoft\Windows\Time Synchronization\SynchronizeTime" /Enable
schtasks /Change /TN "Microsoft\Windows\Time Zone\SynchronizeTimeZone" /Enable
schtasks /Change /TN "Microsoft\Windows\TPM\Tpm-HASCertRetr" /Enable
schtasks /Change /TN "Microsoft\Windows\TPM\Tpm-Maintenance" /Enable
schtasks /Change /TN "Microsoft\Windows\UPnP\UPnPHostConfig" /Enable
schtasks /Change /TN "Microsoft\Windows\User Profile Service\HiveUploadTask" /Enable
schtasks /Change /TN "Microsoft\Windows\WDI\ResolutionHost" /Enable
schtasks /Change /TN "Microsoft\Windows\Windows Filtering Platform\BfeOnServiceStartTypeChange" /Enable
schtasks /Change /TN "Microsoft\Windows\WOF\WIM-Hash-Management" /Enable
schtasks /Change /TN "Microsoft\Windows\WOF\WIM-Hash-Validation" /Enable
schtasks /Change /TN "Microsoft\Windows\Work Folders\Work Folders Logon Synchronization" /Enable
schtasks /Change /TN "Microsoft\Windows\Work Folders\Work Folders Maintenance Work" /Enable
schtasks /Change /TN "Microsoft\Windows\Workplace Join\Automatic-Device-Join" /Enable
schtasks /Change /TN "Microsoft\Windows\WwanSvc\NotificationTask" /Enable
schtasks /Change /TN "Microsoft\Windows\WwanSvc\OobeDiscovery" /Enable
schtasks /Change /Enable /TN "Microsoft\Windows\InstallService\ScanForUpdates"
schtasks /Change /Enable /TN "Microsoft\Windows\InstallService\ScanForUpdatesAsUser"
schtasks /Change /Enable /TN "Microsoft\Windows\InstallService\SmartRetry"
schtasks /Change /Enable /TN "Microsoft\Windows\InstallService\WakeUpAndContinueUpdates"
schtasks /Change /Enable /TN "Microsoft\Windows\InstallService\WakeUpAndScanForUpdates"
schtasks /Change /Enable /TN "Microsoft\Windows\UpdateOrchestrator\Report policies"
schtasks /Change /Enable /TN "Microsoft\Windows\UpdateOrchestrator\Schedule Scan"
schtasks /Change /Enable /TN "Microsoft\Windows\UpdateOrchestrator\Schedule Scan Static Task"
schtasks /Change /Enable /TN "Microsoft\Windows\UpdateOrchestrator\UpdateModelTask"
schtasks /Change /Enable /TN "Microsoft\Windows\UpdateOrchestrator\USO_UxBroker"
schtasks /Change /Enable /TN "Microsoft\Windows\WaaSMedic\PerformRemediation"
schtasks /Change /Enable /TN "Microsoft\Windows\WindowsUpdate\Scheduled Start"
schtasks /Change /TN "Microsoft\Windows\Printing\EduPrintProv" /Enable
schtasks /Change /TN "Microsoft\Windows\WlanSvc\CDSSync" /Enable
schtasks /Change /TN "Microsoft\Windows\WCM\WiFiTask" /Enable
schtasks /Change /TN "Microsoft\Windows\NlaSvc\WiFiTask" /Enable
schtasks /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /Enable
schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /Enable
@echo off
echo.
echo.
echo                                                     [32m [-] TODAS AS TAREFAS REATIVADAS.
echo.
echo                                                     [32m [-] VOLTANDO AO MENU EM 5 SEGUNDOS.
timeout 5 >nul
goto TASK






REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
REM////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
:OPCAO_INVALIDO
cls
echo.
echo.
echo                                                     [31m [-] OPÇÃO INVÁLIDO!
echo.
echo                                                     [31m [-] RETORNANDO EM 5 SEGUNDOS...
timeout 5 >nul
goto MENU