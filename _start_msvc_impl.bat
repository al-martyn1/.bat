@rem Не работает
@rem https://stackoverflow.com/questions/13880742/check-visual-studio-shell-installation-from-batch
@rem @echo off
@rem for /d %%a in ("%programfiles%\Microsoft Visual Studio*") do (
@rem for /f "tokens=3 delims=\" %%x in ("%%a") do echo %%x
@rem )

@set MSVS_TOOLSET=2019
@rem set MSVS_ARCH=x86
@set MSVS_ARCH=x64
@call %~dp0\_find_msvc.bat
@if exist %~dp0\..\set_msvc.bat @call %~dp0\..\set_msvc.bat

@if "%MSVS_TOOLSET%"=="" exit /B 1

@call %~dp0\_generate_msvc.bat msvc%MSVS_TOOLSET% && @start "" ".out\msvc%MSVS_TOOLSET%\%MSVS_ARCH%\%1%.sln"