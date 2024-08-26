@if exist "%~dp0..\umba-brief-scanner.rsp" @set RSP=%~dp0..\umba-brief-scanner.rsp
@rem echo RSP="@%RSP%"
umba-brief-scanner --where
umba-brief-scanner "@%RSP%"        "--scan=%~dp0\../src"  "%~dp0\../doc/_sources_brief.txt"
umba-brief-scanner "@%RSP%" --html "--scan=%~dp0\../src"  "%~dp0\../doc/_sources_brief.html"
umba-brief-scanner "@%RSP%" --md   "--scan=%~dp0\../src"  "%~dp0\../doc/_sources_brief.md_"
