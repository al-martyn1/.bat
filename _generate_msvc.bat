@rem ��������� ��������� �������� x86/x64 Debug/Release ��� �������� ������ MSVC
@rem call this: call _generate_msvc.bat msvc2019|msvc2022
@rem https://learn.microsoft.com/en-us/cpp/build/customize-cmake-settings?view=msvc-170
@call %~dp0\_call_cmake_msvc_impl.bat %1 x86 GENERATE && @call %~dp0\_call_cmake_msvc_impl.bat %1 x64 GENERATE

