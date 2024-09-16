@call "%~dp0\setup_out_root_paths.bat"
@rem
@IF "%OUTROOTPATH%"=="" @(
    @echo OUTROOTPATH not found
    exit /B 1
)
@rem
@if "%DEPLOY_CONFIG%"=="" @set DEPLOY_CONFIG=Release
@rem
@if not exist "%DEPLOY_ROOT%\bin"    mkdir "%DEPLOY_ROOT%\bin"
@if not exist "%DEPLOY_ROOT%\conf"   mkdir "%DEPLOY_ROOT%\conf"
@rem
echo.
@echo Copying binaries
@for %%i in (%DEPLOY_BINS%) do (
    copy /Y /B "%OUTROOTPATH%\%DEPLOY_CONFIG%\%%~i.exe"   "%DEPLOY_ROOT%\bin\"
)
@rem
@if exist "%~dp0..\conf" echo.
@if exist "%~dp0..\conf" echo Copying configuration files
@if exist "%~dp0..\conf" xcopy /Y /S /E /I /F /R "%~dp0..\conf\*"   "%DEPLOY_ROOT%\conf"


