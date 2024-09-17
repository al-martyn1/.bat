if not exist "%~dp0..\set_sln_exes.bat" @goto DO_NOTHING
call "%~dp0..\set_sln_exes.bat"
@rem
call "%~dp0\setup_out_root_paths.bat"
@rem
IF "%OUTROOTPATH%"=="" (
    echo OUTROOTPATH not found
    exit /B 1
)
@rem
for %%i in (%SLN_EXES%) do (
     if not exist "%~dp0..\doc" mkdir "%~dp0..\doc"
     "%OUTROOTPATH%\Release\%%~i.exe" --md --help > "%~dp0..\doc\%%~i-cli-options.md_
)
:DO_NOTHING
exit /B 0