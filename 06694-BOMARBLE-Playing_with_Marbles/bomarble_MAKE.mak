NOM = bomarble
EXT = .c
CXX = gcc
INCL = -IE:\_CLOUDAPPS\devel\npp\_TOOLS\C\_MINGW\liblist\include
LIBS = -LE:\_CLOUDAPPS\devel\npp\_TOOLS\C\_MINGW\liblist\lib -llist
RES = 
COP = -std=c99 -O2 -Wall -Wextra

$(NOM).exe: $(NOM)$(EXT)
	$(CXX) $(COP) -o $(NOM).exe $(NOM)$(EXT) $(RES) $(INCL) $(LIBS)
	
clean:
	del *.o
