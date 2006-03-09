@echo off

rem
rem   ethna.bat
rem
rem   simple command line gateway
rem
rem   $Id$
rem

if "%OS%"=="Windows_NT" @setlocal

set DEFAULT_ETHNA_HOME=%~dp0..

goto init
goto cleanup

:init

if "%ETHNA_HOME%" == "" set ETHNA_HOME=%DEFAULT_ETHNA_HOME%
set DEFAULT_ETHNA_HOME=

if "%PHP_COMMAND%" == "" goto no_phpcommand
if "%PHP_CLASSPATH%" == "" goto set_classpath

goto run
goto cleanup

:run
IF EXIST "@PEAR-DIR@" (
  %PHP_COMMAND% -d html_errors=off -qC "@PEAR-DIR@\ethna_handle.php" %1 %2 %3 %4 %5 %6 %7 %8 %9
) ELSE (
  %PHP_COMMAND% -d html_errors=off -qC "%ETHNA_HOME%\bin\ethna_handle.php" %1 %2 %3 %4 %5 %6 %7 %8 %9
)
goto cleanup

:no_phpcommand
set PHP_COMMAND=php.exe
goto init

:set_classpath
set PHP_CLASSPATH=%ETHNA_HOME%\lib
goto init

:cleanup
if "%OS%"=="Windows_NT" @endlocal
REM pause
