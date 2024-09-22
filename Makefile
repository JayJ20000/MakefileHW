# Jalen Jones
# Makefile practice file
# 9/20/24


CC = g++                                # Compiler
TARGET = employee                       # Target executable name
CFLAGS = -c -Wall -Wextra               # Compile with all errors and warnings

# Target to build files
all: $(TARGET)

# Linking all object files
$(TARGET): main.o Employee.o Officer.o Supervisor.o
	$(CC) main.o Employee.o Officer.o Supervisor.o -o $(TARGET)

# Compiling the main.o file from main.cpp
main.o: main.cpp Employee.h Officer.h Supervisor.h
	$(CC) $(CFLAGS) main.cpp

# Compiling the Employee.o file from Employee.cpp
Employee.o: Employee.cpp Employee.h
	$(CC) $(CFLAGS) Employee.cpp

# Compiling the Officer.o file from Officer.cpp
Officer.o: Officer.cpp Officer.h Employee.h
	$(CC) $(CFLAGS) Officer.cpp

# Compiling the Supervisor.o file from Supervisor.cpp
Supervisor.o: Supervisor.cpp Supervisor.h Officer.h Employee.h
	$(CC) $(CFLAGS) Supervisor.cpp

# Cleaning all object files
clean:
	rm -f *.o *~ $(TARGET)
