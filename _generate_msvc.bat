@rem author Alexander Martynov (Marty AKA al-martyn1) <amart@mail.ru>
@rem copyright (c) 2024-2026 Alexander Martynov
@rem brief 
@rem ----------------------------------------------------------------

@rem Генерация сборочных скриптов x86/x64 Debug/Release для заданной версии MSVC
@rem call this: call _generate_msvc.bat msvc2017|msvc2019|msvc2022|msvc2026
@rem https://learn.microsoft.com/en-us/cpp/build/customize-cmake-settings?view=msvc-170

@set VSVER=%1
@set ARCH=%2

@if "%VSVER%"=="" @goto VER_NOT_TAKEN
@if "%ARCH%"==""  @goto ARCH_NOT_TAKEN

@if "%MSVC_ARCH%"=="x64" goto GENERATE_X64
@if "%MSVC_ARCH%"=="x86" goto GENERATE_X86
@if "%MSVC_ARCH%"=="all" goto GENERATE_ALL
@echo Unknown MSVC_ARCH: %MSVC_ARCH%
@exit /B 1

:GENERATE_X86
@call %~dp0\_call_cmake_msvc_impl.bat %VSVER% x86 GENERATE
@exit /B 0

:GENERATE_X64
@call %~dp0\_call_cmake_msvc_impl.bat %VSVER% x64 GENERATE
@exit /B 0

:GENERATE_ALL
@call %~dp0\_call_cmake_msvc_impl.bat %VSVER% x86 GENERATE
@call %~dp0\_call_cmake_msvc_impl.bat %VSVER% x64 GENERATE
@exit /B 0

:VER_NOT_TAKEN 
@echo MSVC version not taken (msvc2017/msvc2019/msvc2022/msvc2026)
@echo Usage: %~n0 MSVCVER ARCH
@exit /B 1

:ARCH_NOT_TAKEN
@echo Architecture not taken (x86/x64/all)
@echo Usage: %~n0 MSVCVER ARCH
@exit /B 1
