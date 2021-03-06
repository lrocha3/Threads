CC = g++

BIN = Threads.exe

INC_DIR = inc
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin


#Ao definir o SRC e colocar a var
#OBJ apenas com os ficheiros
#que o SRC tem a compilação
#só vai criar os objectos que são
#necessários. Ficheiros dummy não
#são adicionados.

SRC = $(SRC_DIR)/main.cpp

OBJ  = $(SRC:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)
#$(info $$OBJ is [${OBJ}]) to print var


INCFLAGS = -I $(INC_DIR)
DEBUG = -g

#C++ Standard
CPPSTD = -std=c++11

#CFLAGS --> Creation of objects
CFLAGS = -Wall -c $(DEBUG) $(CPPSTD)
#LDFLAGS --> Linking Objects
LDFLAGS = -Wall $(DEBUG)
#LBLIBS --> -lm -pthread ..
LDLIBS ?=
#? == nothing still

# $(LDLIBS) -o $@ from first to last calls the same command
#$^ calls every occurence of a lib for example in one command only

all: $(BIN_DIR)/$(BIN)

$(BIN_DIR)/$(BIN): $(OBJ)
	$(info Linking objs to bin.)
	$(CC) $(LDFLAGS) $^$(LDLIBS) -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp


$(OBJ): $(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(info Creating objs.)
	$(CC) $(INCFLAGS) $(CFLAGS) $< -o $@

clean:
	$(info Deleting objs and bin.)
	$(RM) $(OBJ) $(BIN_DIR)/$(BIN)

execute:
	@if test -f $(BIN_DIR)/$(BIN); then \
		./$(BIN_DIR)/$(BIN); \
	else \
		echo "No binary file!"; \
	fi

#if there is a file in the
#makefile directory with
#the name all, clean or execute
#the make all or make clean or make execute
#will be guaranted to be executed.

.PHONY: all clean execute
