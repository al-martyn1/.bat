@if exist "%~dp0..\umba-brief-scanner.rsp" @set RSP="@%~dp0..\umba-brief-scanner.rsp"
@rem echo RSP="@%RSP%"

@setlocal EnableDelayedExpansion
@set BRIEF_SCAN_PATHS_UNQUOTED=!BRIEF_SCAN_PATHS:"=!
@set BRIEF_EXTRA_OPTS_TXT_UNQUOTED=!BRIEF_EXTRA_OPTS_TXT:"=!
@set BRIEF_EXTRA_OPTS_MD_UNQUOTED=!BRIEF_EXTRA_OPTS_MD:"=!
@endlocal


@if "%BRIEF_SCAN_PATHS_UNQUOTED%"=="" @set BRIEF_SCAN_PATHS="--scan=%~dp0.."
@rem if "%BRIEF_EXTRA_OPTS_TXT_UNQUOTED%"=="" @set BRIEF_EXTRA_OPTS_TXT=--scan-notes "--notes-output-path=%~dp0\../doc/_md"
@if "%BRIEF_EXTRA_OPTS_MD_UNQUOTED%"==""  @set BRIEF_EXTRA_OPTS_MD=--scan-notes "--notes-output-path=%~dp0\../doc/_md"
umba-brief-scanner --where
@rem umba-brief-scanner --overwrite %RSP%                %BRIEF_SCAN_PATHS% %BRIEF_EXTRA_OPTS_TXT% "%~dp0\../doc/_md/_sources_brief.txt"
@rem umba-brief-scanner --overwrite %RSP% --html         %BRIEF_SCAN_PATHS%                        "%~dp0\../doc/_md/_sources_brief.html"
umba-brief-scanner --overwrite %RSP% --md --split-group  %BRIEF_SCAN_PATHS% %BRIEF_EXTRA_OPTS_MD%  "%~dp0\../doc/_md/sources_brief.md_"
umba-brief-scanner --overwrite %RSP% --md --main-only    %BRIEF_SCAN_PATHS%                        "%~dp0\../doc/_md/entry_points.md_"
