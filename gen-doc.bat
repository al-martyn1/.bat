@call "%~dp0\make_sources_brief.bat"

@set EXCLUDE_DIRS=--batch-exclude-dir=_libs,libs,_lib,lib,tests,test,rc,_generators,conf,_distr_conf,src,.msvc2019,boost,icons
@set COMMON=--overwrite --copy-images
@set GRAPHVIZ_OPTIONS="--graphviz-output-path=%~dp0\..\doc\.generated_images"
@rem set TEMP_OPTS=--graphviz-keep-temp-dot-files
@set OPTIONS= %TEMP_OPTS% %COMMON% %VARS% %EXCLUDE_DIRS% %GRAPHVIZ_OPTIONS% %UMBA_MDPP_EXTRA_OPTIONS% "--batch-scan-recurse=%~dp0\.."
umba-md-pp %OPTIONS%
