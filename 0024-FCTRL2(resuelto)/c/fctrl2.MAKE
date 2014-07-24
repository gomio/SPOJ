NOM = fctrl2
EXT = .c
CXX = gcc
INCL = 
LIBS = 
RES = 
COP = -std=c99 -O2 -Wall -Wextra

$(NOM).exe: $(NOM)$(EXT)
	$(CXX) $(COP) -o $(NOM).exe $(NOM)$(EXT) $(RES) $(INCL) $(LIBS)
	
clean:
	del *.o
