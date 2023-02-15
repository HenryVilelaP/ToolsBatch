@ECHO OFF
SET registreChemin=HKEY_CURRENT_USER\Control Panel\International
SET registreCle=sDecimal
SET registreType=REG_SZ
SET registreValeurVirgule=,
SET registreValeurPoint=.
REG QUERY "%registreChemin%" /v "%registreCle%" | FIND "%registreValeurPoint%"
CLS
IF %ERRORLEVEL%==1 GOTO ADD_POINT
IF %ERRORLEVEL%==0 GOTO ADD_VIRGULE
:ADD_VIRGULE
REG ADD "HKEY_CURRENT_USER\Control Panel\International" /f /v "sDecimal" /t %registreType% /d "%registreValeurVirgule%"
CLS
ECHO Separateur decimal ","
GOTO END
:ADD_POINT
REG ADD "HKEY_CURRENT_USER\Control Panel\International" /f /v "sDecimal" /t %registreType% /d "%registreValeurPoint%"
CLS
ECHO Separateur decimal "."
GOTO END
:END
PAUSE