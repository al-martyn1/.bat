@if exist "%~dp0..\umba-brief-scanner.rsp" @set RSP="@%~dp0..\umba-brief-scanner.rsp"
@rem echo RSP="@%RSP%"
umba-brief-scanner --where
umba-brief-scanner --overwrite "%RSP%"        "--scan=%~dp0\../src" "--scan=%~dp0\../examples" "%~dp0\../doc/_sources_brief.txt"
umba-brief-scanner --overwrite "%RSP%" --html "--scan=%~dp0\../src" "--scan=%~dp0\../examples" "%~dp0\../doc/_sources_brief.html"
umba-brief-scanner --overwrite "%RSP%" --md   "--scan=%~dp0\../src" "--scan=%~dp0\../examples" "%~dp0\../doc/_sources_brief.md_"
