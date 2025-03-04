@cd "%~dp0.."
@echo Pulling project
git pull --recurse-submodules
if not exist "%~dp0..\.gitmodules" @goto SUBMODULES_UPDATE_DONE
@echo Updating submodules
@cd "%~dp0.."
git submodule update --init --recursive --merge
@if "%1"=="no-pull" @goto NO_PULL
@if "%1"=="no_pull" @goto NO_PULL
@if "%1"=="NO-PULL" @goto NO_PULL
@if "%1"=="NO_PULL" @goto NO_PULL
@if "%1"=="no-pull-submodules" @goto NO_PULL
@if "%1"=="no_pull_submodules" @goto NO_PULL
@if "%1"=="NO-PULL-SUBMODULES" @goto NO_PULL
@if "%1"=="NO_PULL_SUBMODULES" @goto NO_PULL
@if not exist "%~dp0..\.bat" @goto SUBMODULE_BAT_DONE
@cd "%~dp0..\.bat"
@echo Pulling .bat submodule
git.exe checkout main --
git pull
@cd "%~dp0.."
:SUBMODULE_BAT_DONE
@if not exist "%~dp0..\.cmake" @goto SUBMODULE_CMAKE_DONE
@cd "%~dp0..\.cmake"
@echo Pulling .cmake submodule
git.exe checkout main --
git pull
@cd "%~dp0.."
:SUBMODULES_UPDATE_DONE
:SUBMODULE_CMAKE_DONE
:NO_PULL
@if not exist "%~dp0..\_libs\update_libs.bat" @goto LIBS_DONE
@cd "%~dp0..\_libs"
@echo Pulling libs
@call update_libs.bat
@cd "%~dp0.."
:LIBS_DONE
@exit /B 0
