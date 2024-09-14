@rem Configure OUTROOTPATHS var
@call "%~dp0\setup_out_root_paths.bat"

@rem echo OUTROOTPATHS=%OUTROOTPATHS%

@FOR %%i IN (%OUTROOTPATHS%) DO @(
    @FOR %%j IN (%PLATFORMS%) DO @(
        @IF EXIST "%OUTROOTPATH_BASE%\%%~i\%%~j" @(
            echo Copying "%~dp0\..\conf\*" to "%OUTROOTPATH_BASE%\%%~i\%%~j\\conf"
            @xcopy /Y /S /E /I /F /R "%~dp0\..\conf\*"  "%OUTROOTPATH_BASE%\%%~i\%%~j\\conf"
)
)
)
