@if "%VS160COMNTOOLS%"=="" goto CHECK_2022
@set MSVS_TOOLSET=2019
@exit /B 0

:CHECK_2022
@if not exist "%ProgramFiles%\Microsoft Visual Studio\2022" goto CHECK_2025
@set MSVS_TOOLSET=2022
@exit /B 0

:CHECK_2025
@exit /B 1

