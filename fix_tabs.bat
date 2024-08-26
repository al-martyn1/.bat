@set EMPTY=
@rem 
@set PROCESS_FILES_MASKS=*.cpp^,*.c^,*.cc^,*.cxx^,*.c++^,*.hpp^,*.h^,*.hxx^,*.h++^,*.md_^ %EMPTY%
@set OPT_PROCESS_FILES=--include-files=%PROCESS_FILES_MASKS%
@rem 
@set EXCLUDE_FILES_MASKS=*/_libs/*^ %EMPTY%
@set OPT_EXCLUDE_FILES=--exclude-files=%EXCLUDE_FILES_MASKS%
@rem 
@set TABTOOL_TAB_OPTS=--tab-size=4 --tab-delta=1 --tab --remove-trailing-spaces=Y
@rem 
@umba-tabtool %TABTOOL_TAB_OPTS% %OPT_PROCESS_FILES% %OPT_EXCLUDE_FILES% --scan "%~dp0\../doc" "%~dp0\../src" "%~dp0\../tests"
