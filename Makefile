CC = g++

SRC_DIR = src
INC_DIR = include
OBJ_DIR = obj
BIN_DIR = bin

CFLAGS := -Ofast -I$(INC_DIR)

SRCS := $(wildcard $(SRC_DIR)/*.cpp) $(wildcard $(BKND_SRC_DIR)/*.cpp)
OBJS := $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(SRCS))

all: mkdirs $(BIN_DIR)/imgui.a

mkdirs:
	@if [ ! -d "obj" ]; then \
		mkdir obj; \
	fi; \
	if [ ! -d "bin" ]; then \
		mkdir bin; \
	fi

$(BIN_DIR)/imgui.a: $(OBJS)
	ar rcs $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJ_DIR)/* $(BIN_DIR)/*

.PHONY: all mkdirs clean
