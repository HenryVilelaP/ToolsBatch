@ECHO OFF
setlocal enabledelayedexpansion
SET /P numero=¨Numero de segundos entre cada ping?
:Ciclo
SET prueba=
ping localhost -n %numero% >nul
(ping google.es
echo %DATE% %TIME%)>1.txt
find /C /I "(0%% perdidos" "1.txt">2.txt
FOR /F "tokens=*" %%A IN ('TYPE 2.txt') DO (SET prueba=!prueba!%%A)
SET prueba=%prueba:---------- 1.TXT:=%
SET prueba=%prueba: =%
IF NOT "%prueba%"=="0" (GOTO Ciclo)
FOR /F "tokens=*" %%B IN ('TYPE 1.txt') DO (SET fecha=%%B)
echo Paquete perdido
echo Paquete perdido %fecha%>>"Paquetes perdidos.txt"
GOTO Ciclo