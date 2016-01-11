@pskill -t >nul 2>nul mingw32-make.exe 
@pskill -t >nul 2>nul make.exe 
@pskill -t >nul 2>nul gcc.exe 
@pskill -t >nul 2>nul g++.exe 
@pskill -t >nul 2>nul ld.exe 
@pskill -t >nul 2>nul collect2.exe 
mingw32-make.exe -f onp.MAKE 
@echo. 
@if '%NOM%'=='' pause 
