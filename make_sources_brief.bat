@if exist "%~dp0..\umba-brief-scanner.rsp" @set RSP="@%~dp0..\umba-brief-scanner.rsp"
@rem echo RSP="@%RSP%"

@setlocal EnableDelayedExpansion
@set BRIEF_SCAN_PATHS_UNQUOTED=!BRIEF_SCAN_PATHS:"=!
@set BRIEF_EXTRA_OPTS_TXT_UNQUOTED=!BRIEF_EXTRA_OPTS_TXT:"=!
@set BRIEF_EXTRA_OPTS_MD_UNQUOTED=!BRIEF_EXTRA_OPTS_MD:"=!
@endlocal


@if "%BRIEF_SCAN_PATHS_UNQUOTED%"=="" @set BRIEF_SCAN_PATHS="--scan=%~dp0.."
@rem if "%BRIEF_EXTRA_OPTS_TXT_UNQUOTED%"=="" @set BRIEF_EXTRA_OPTS_TXT=--scan-notes "--notes-output-path=%~dp0\../doc"
@if "%BRIEF_EXTRA_OPTS_MD_UNQUOTED%"==""  @set BRIEF_EXTRA_OPTS_MD=--scan-notes "--notes-output-path=%~dp0\../doc"
umba-brief-scanner --where
umba-brief-scanner --overwrite "%RSP%"        %BRIEF_SCAN_PATHS% %BRIEF_EXTRA_OPTS_TXT% "%~dp0\../doc/_sources_brief.txt"
umba-brief-scanner --overwrite "%RSP%" --html %BRIEF_SCAN_PATHS%                        "%~dp0\../doc/_sources_brief.html"
umba-brief-scanner --overwrite "%RSP%" --md   %BRIEF_SCAN_PATHS% %BRIEF_EXTRA_OPTS_MD%  "%~dp0\../doc/_sources_brief.md_"
