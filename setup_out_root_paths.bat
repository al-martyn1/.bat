@set OUTROOTPATH_BASE=%~dp0..\.out
@set PLATFORMS=win32-x64 x64 win32-x86 x86 win32-unknown unknown
@set CONFIGS=Release MinSizeRel RelWithDebInfo Debug
@rem
@rem Тулсеты от VSCode/CMakeTools - переименовываем при помощи umba-subst-macros, имена попроще и попонятнее, и везде одинаковые
@rem
@set MSVC_OLD_NAMES=msvc2017 msvc2019 msvc2022
@set COMPAT_NAMES="GCC 7.3.0 i686-w64-mingw32" "GCC 7.3.0 x86_64-w64-mingw32"
@set CLANG12_NAMES="Clang 12/GNU x64 VS 2019 16.11.34931.43" "Clang 12/GNU x86 VS 2019 16.11.34931.43" "Clang 12/GNU x64 VS 2019 16.11.33529.622" "Clang 12/GNU x86 VS 2019 16.11.33529.622"  "Clang 12/MSVC x64 VS 2019 16.11.34931.43" "Clang 12/MSVC x86 VS 2019 16.11.34931.43"  "Clang 12/MSVC x64 VS 2019 16.11.33529.622" "Clang 12/MSVC x86 VS 2019 16.11.33529.622" 
@set GCC47_NAMES="GCC 4.7 MinGW"
@set GCC73_NAMES="GCC 7.3 x86 MinGW" "GCC 7.3 x64 MinGW"
@set GCC81_NAMES="GCC 8.1 x86 MinGW" "GCC 8.1 x64 MinGW"
@set GCC130_NAMES="GCC 13.2 MinGW" "GCC 13.2 ARM None EABI"
@set VS2013_NAMES="MSVC 12 VS 2013 x64" "MSVC 12 VS 2013 x86 (x64 host)" "MSVC 12 VS 2013 x86" "MSVC 12 VS 2013 x64 (x86 host)"
@set VS2015_NAMES="MSVC 14 VS 2015 x64" "MSVC 14 VS 2015 x86 (x64 host)" "MSVC 14 VS 2015 x86" "MSVC 14 VS 2015 x64 (x86 host)"
@set VS2017_MSB_NAMES="MSVC 15 VS 2017 x64 (MSBuild)" "MSVC 15 VS 2017 x86 (x64 host) (MSBuild)" "MSVC 15 VS 2017 x86 (MSBuild)" "MSVC 15 VS 2017 x64 (x86 host) (MSBuild)"
@set VS2017_NAMES="MSVC 15 VS 2017 x64" "MSVC 15 VS 2017 Arm (x64 host)" "MSVC 15 VS 2017 Arm64 (x64 host)" "MSVC 15 VS 2017 x86 (x64 host)" "MSVC 15 VS 2017 x86" "MSVC 15 VS 2017 x64 (x86 host)" "MSVC 15 VS 2017 Arm (x86 host)" "MSVC 15 VS 2017 Arm64 (x86 host)"
@set VS2019_NAMES="MSVC 16 VS 2019 x64" "MSVC 16 VS 2019 Arm64 (x64 host)" "MSVC 16 VS 2019 x86 (x64 host)" "MSVC 16 VS 2019 x86" "MSVC 16 VS 2019 x64 (x86 host)" "MSVC 16 VS 2019 Arm64 (x86 host)"
@set VS2022_NAMES="MSVC 17 VS 2022 x64" "MSVC 17 VS 2022 x86 (x64 host)" "MSVC 17 VS 2022 x86" "MSVC 17 VS 2022 x64 (x86 host)"
@rem
@set OUTROOTPATHS=%MSVC_OLD_NAMES% %COMPAT_NAMES% %CLANG12_NAMES% %GCC47_NAMES% %GCC73_NAMES% %GCC81_NAMES% %GCC130_NAMES% %VS2013_NAMES% %VS2015_NAMES% %VS2017_MSB_NAMES% %VS2017_NAMES% %VS2019_NAMES% %VS2022_NAMES%
@rem
@for %%i in (%OUTROOTPATHS%) do @(
    @for %%j in (%PLATFORMS%) do @(
        @if exist "%OUTROOTPATH_BASE%\%%~i\%%~j" @(
            @set OUTROOTPATH=%OUTROOTPATH_BASE%\%%~i\%%~j
            @goto OUTROOTPATH_FOUND
)
)
)
@exit /B 1
:OUTROOTPATH_FOUND
@exit /B 0
