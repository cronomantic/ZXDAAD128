CC = x86_64-w64-mingw32-gcc
CFLAGS  = -O3 -Wall -DNDEBUG -s
RM = rm -f 
EXTENSION = .exe

all: DCP

DCP: DCP.c optimize.c compress.c memory.c zx0.h
	$(CC) $(CFLAGS) -o DCP$(EXTENSION) DCP.c optimize.c compress.c memory.c

clean:
	$(RM) *.obj DCP$(EXTENSION)
