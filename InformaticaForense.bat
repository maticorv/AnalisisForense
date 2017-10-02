@echo off 
color 0 
title informatica forense 2017 
:menu 
cls 
echo, 
echo,
echo -------------------------------------------------------------------------------
echo --------------------------HERRAMIENTA DE AUDITORIA-----------------------------
echo ------------------------------------------------------------------------------- 
echo -------------------------------------------------------------------------------
echo ----------------------------------MENU-----------------------------------------
echo -------------------------------------------------------------------------------
echo --- 1. Historico de 1000 comandos ejecutados                                ---
echo --- 2. Registrar la hora y fecha del sistema al inciar la recoleccion       ---
echo --- 3. Derterminar quien esta logueado en el sistema                        ---
echo --- 4. Registrar accesos, creaciones y modificaciones de todos los archivos ---
echo --- 5. Determinar puertos abiertos                                          ---
echo --- 6. Listar aplicaciones asociadas a los puertos                          ---
echo --- 7. Listar procesos ejecutandose                                         ---
echo --- 8. Listar conexiones actuales y recientes                               ---
echo --- 9.Salir                                                                ---
echo -------------------------------------------------------------------------------
echo -------------------------------------------------------------------------------
echo -------------------------------------------------------------------------------
echo -------------------------------------------------------------------------------
set opt=0
set/p opt= 
if %opt%==1 goto history 
if %opt%==2 goto startdatetime 
if %opt%==3 goto logs 
if %opt%==4 goto dir
if %opt%==5 goto network
if %opt%==6 goto apps	
if %opt%==7 goto process
if %opt%==8 goto conections
if %opt%==9 goto exit
echo. El numero "%opt%" no es una opcion valida, por favor intente de nuevo.
timeout 5
goto:menu

:history 
cls
echo.
echo.
echo Historico de 1000 comandos ejecutados:
doskey /listsize=1000
echo. >> recoleccion.txt
echo. >> recoleccion.txt
echo Historico de 1000 comandos ejecutados: >> recoleccion.txt
doskey /listsize=1000 >> recoleccion.txt
echo. >> recoleccion.txt
echo. >> recoleccion.txt
echo.
echo.
echo Pulse una tecla para volver al menu 
pause>nul 
goto:menu 

:startdatetime 
cls 
echo.
echo.
echo Hora inicio de recoleccion:
echo %date%-%time%
echo. >> recoleccion.txt
echo. >> recoleccion.txt	
echo Hora inicio de recoleccion >> recoleccion.txt
echo %date%-%time% >> recoleccion.txt
echo. >> recoleccion.txt
echo. >> recoleccion.txt	
echo.
echo.
echo Pulse una tecla para volver al menu 
pause>nul 
goto menu 

:logs 
cls 
echo.
echo.
echo Los usiarios logueados en el sistema son:
psloggedon
echo. >> recoleccion.txt
echo. >> recoleccion.txt	
echo Los usiarios logueados en el sistema son: >> recoleccion.txt
psloggedon >> recoleccion.txt
echo. >> recoleccion.txt
echo. >> recoleccion.txt	
echo.
echo.
echo Pulse una tecla para volver al menu 
pause>nul 
goto menu 

:dir 
cls
echo.
echo. 
echo Fecha ultimo acceso
dir /t:a /a /s /o:d c:\
echo.
echo.
echo Fecha creacion
dir /t:c /a /s /o:d c:\
echo.
echo. 
echo Fecha modificacion
dir /t:w /a /s /o:d c:\ 
echo.
echo.
echo. >> recoleccion.txt
echo. >> recoleccion.txt
echo Fecha ultimo acceso: >> recoleccion.txt
dir /t:a /a /s /o:d c:\ >> recoleccion.txt
echo. >> recoleccion.txt
echo. >> recoleccion.txt
echo Fecha creacion: >> recoleccion.txt
dir /t:c /a /s /o:d c:\ >> recoleccion.txt
echo. >> recoleccion.txt
echo. >> recoleccion.txt
echo Fecha modificacion: >> recoleccion.txt
dir /t:w /a /s /o:d c:\ >> recoleccion.txt
echo. >> recoleccion.txt
echo. >> recoleccion.txt
echo.
echo.
echo Pulse una tecla para volver al menu 
pause>nul 
goto menu 

:network 
cls 
echo.
echo.
echo Los puertos abiertos son:
netstat
echo Los puertos abiertos son: >> recoleccion.txt
netstat >> recoleccion.txt
echo.
echo.
echo Pulse una tecla para volver al menu 
pause>nul 
goto menu

:apps 
cls 
echo.
echo.
echo Las aplicaciones asociadas a los puertos son:
netstat -b
echo Las aplicaciones asociadas a los puertos son: >> recoleccion.txt
netstat -b >> recoleccion.txt
echo.
echo.
echo Pulse una tecla para volver al menu 
pause>nul 
goto menu  

:process 
cls 
echo.
echo.
echo Lista procesos ejecutandose:
pslist -t
echo Lista procesos ejecutandose: >> recoleccion.txt
pslist -t>> recoleccion.txt
echo.
echo.
echo Pulse una tecla para volver al menu 
pause>nul 
goto menu 

:conections 
cls 
echo.
echo.
echo Lista de conexiones actuales y recientes:
%WINDIR%\system32\arp.exe –a
echo.
echo.
%WINDIR%\system32\nbtstat.exe  -c
echo. >> recoleccion.txt
echo. >> recoleccion.txt
echo Lista de conexiones actuales y recientes:>>recoleccion.txt
%WINDIR%\system32\arp.exe –a>> recoleccion.txt
echo. >> recoleccion.txt
echo. >> recoleccion.txt
%WINDIR%\system32\nbtstat.exe  -c>> recoleccion.txt
echo. >> recoleccion.txt
echo. >> recoleccion.txt
echo.
echo.
echo Pulse una tecla para volver al menu 
pause>nul 
goto menu 


:exit
cls 
echo.
echo.
echo Hora de finalizacion de recoleccion:
echo %date%-%time%
echo. >> recoleccion.txt
echo. >> recoleccion.txt	
echo Hora de finalizacion de recoleccion >> recoleccion.txt
echo %date%-%time% >> recoleccion.txt
echo. >> recoleccion.txt
echo. >> recoleccion.txt	
echo.
echo.
timeout 5
    @cls&exit 