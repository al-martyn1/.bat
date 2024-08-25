@call "%~dp0\setup_out_root_paths.bat"

@rem https://superuser.com/questions/1569197/what-is-the-meaning-of-tilde-in-batch-variables

@FOR %%i IN (%OUTROOTPATHS%) DO @(
    @FOR %%j IN (Release Debug) DO @(
        @rem echo %%~i\%%j
        @IF EXIST "%%~i\%%j\gen-lang-detection-tr.exe" @(
            @set GEN_LANG_DETECTION_TR="%%~i\%%j\gen-lang-detection-tr.exe"
            @goto GEN_LANG_DETECTION_TR_FOUND
)
)
)

:GEN_LANG_DETECTION_TR_FOUND

