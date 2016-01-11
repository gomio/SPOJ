set PB_PBC=E:\_CLOUDAPPS\devel\npp\_TOOLS\PB\PB_MIN.531\compilers\pbcompiler.exe
set PB_OPC=/QUIET /CONSOLE 
set PB_APP=bomarble
set PB_RES=
set PB_ICO=
mingw32-make -f bomarble-MAKEFILE.531
upx -k bomarble.exe
del /q *.ex~
@echo. 
@pause 
