set PB_PBC=E:\_CLOUDAPPS\devel\npp\_TOOLS\PB\PB_MIN.531\compilers\pbcompiler.exe
set PB_OPC=/QUIET /CONSOLE 
set PB_APP=bolesson
set PB_RES=
set PB_ICO=
mingw32-make -f bolesson-MAKEFILE.531
upx -k bolesson.exe
del /q *.ex~
@echo. 
@pause 
