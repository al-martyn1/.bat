@call "%~dp0\setup_out_root_paths.bat"
@set LOOKUP_FOR=%1
@rem https://superuser.com/questions/1569197/what-is-the-meaning-of-tilde-in-batch-variables
@FOR %%i IN (%OUTROOTPATHS%) DO @(
    @rem echo I=%%~i
    @FOR %%p in (%PLATFORMS%) do @(
        @rem echo P=%%~i
        @FOR %%j IN (Debug Release) DO @(
            @rem echo J=%%j
            @rem echo TEST_PATH=%~dp0\..\.out\%%~i\%%p\%%j\%LOOKUP_FOR%.exe
            @IF EXIST "%~dp0\..\.out\%%~i\%%p\%%j\%LOOKUP_FOR%.exe" @(
                @set FOUND_EXE="%~dp0\..\.out\%%~i\%%p\%%j\%LOOKUP_FOR%.exe"
                @goto FOUND
)
)
)
)
:FOUND
