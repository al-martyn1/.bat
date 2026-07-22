@rem author Alexander Martynov (Marty AKA al-martyn1) <amart@mail.ru>
@rem copyright (c) 2024-2026 Alexander Martynov
@rem brief 
@rem ----------------------------------------------------------------

@rem Не работает
@rem https://stackoverflow.com/questions/13880742/check-visual-studio-shell-installation-from-batch
@rem @echo off
@rem for /d %%a in ("%programfiles%\Microsoft Visual Studio*") do (
@rem for /f "tokens=3 delims=\" %%x in ("%%a") do echo %%x
@rem )

@if not "%MSVC%"=="" @echo Force taken MSVC=%MSVC%
@if not "%MSVC%"=="" @goto MSVC_TAKEN

@if not "%SKIP_IMPLISIT_MSVC_SETUP%"=="" @echo Force skip implicit MSVC setup
@if not "%SKIP_IMPLISIT_MSVC_SETUP%"=="" @goto SKIP_IMPLISIT_MSVC_SETUP

@if not exist %~dp0\..\.set_msvc.bat @echo Skip implicit MSVC setup - there is no '.set_msvc.bat' in project root folder
@if not exist %~dp0\..\.set_msvc.bat @goto SKIP_IMPLISIT_MSVC_SETUP

@echo Calling PROJECT_ROOT\.set_msvc.bat
@call %~dp0\..\.set_msvc.bat
@echo Explicit MSVC=%MSVC%
@echo Explicit MSVC_ARCH=%MSVC_ARCH%
@goto MSVC_TAKEN

:SKIP_IMPLISIT_MSVC_SETUP
@echo Enter MS Visual Studio Version (2017/15, 2019/16, 2022/17, 2026/18, D/d/default):
@set /p MSVC=
@if "%MSVC%"=="2017"    @set MSVC=2017
@if "%MSVC%"=="2019"    @set MSVC=2019
@if "%MSVC%"=="2022"    @set MSVC=2022
@if "%MSVC%"=="2026"    @set MSVC=2026
@if "%MSVC%"=="15"      @set MSVC=2017
@if "%MSVC%"=="16"      @set MSVC=2019
@if "%MSVC%"=="17"      @set MSVC=2022
@if "%MSVC%"=="18"      @set MSVC=2026
@if "%MSVC%"=="D"       @(
  @set MSVC=
  @call %~dp0\_find_msvc.bat
)
@if "%MSVC%"=="d"       @(
  @set MSVC=
  @call %~dp0\_find_msvc.bat
)
@if "%MSVC%"=="default" @(
  @set MSVC=
  @call %~dp0\_find_msvc.bat
)

@if "%MSVC%"=="" exit /B 1

@echo Entered MSVC=%MSVC%


:MSVC_TAKEN

@rem Не будем заставлять вводить архитектуру, по умолчанию примем x64, оно сейчас уже везде
@rem А кому надо собирать x86, пусть заморочатся
@if "%MSVC_ARCH%"=="" @set MSVC_ARCH=x64
@echo MSVC=%MSVC%
@echo MSVC_ARCH=%MSVC_ARCH%

set MSVC_SLN_EXT=sln
@call %~dp0\msvc_set_sln_ext.bat
@call %~dp0\_generate_msvc.bat msvc%MSVC% %MSVC_ARCH% && @start "" ".out\msvc%MSVC%\%MSVC_ARCH%\%1.%MSVC_SLN_EXT%"