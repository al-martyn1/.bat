@rem https://learn.microsoft.com/en-us/cpp/build/customize-cmake-settings?view=msvc-170
@call "%~dp0\_call_cmake_msvc_impl.bat" msvc2022 x86 GENERATE && @call "%~dp0\_call_cmake_msvc_impl.bat" msvc2022 x64 GENERATE

