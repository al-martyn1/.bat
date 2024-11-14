@set EMPTY=
@set PROCESS_FILES_MASKS=*.cpp^,*.c^,*.cc^,*.cxx^,*.c++^,*.hpp^,*.h^,*.hxx^,*.h++^,*.md_^ %EMPTY%
@set EXCLUDE_FILES_MASKS=*/_libs/*^ %EMPTY%
@umba-tabtool --check --space --scan --include-files=%PROCESS_FILES_MASKS% --exclude-files=%EXCLUDE_FILES_MASKS% "%~dp0\../doc" "%~dp0\../src" "%~dp0\../_src" "%~dp0\../tests"

