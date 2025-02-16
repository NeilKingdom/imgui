CC = g++

SRC_DIR = src
INC_DIR = include
OBJ_DIR = obj
BIN_DIR = bin

CFLAGS := -Ofast -I$(INC_DIR)

SRCS := $(wildcard $(SRC_DIR)/*.cpp) $(wildcard $(BKND_SRC_DIR)/*.cpp)
OBJS := $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(SRCS))

$(BIN_DIR)/imgui.a: $(OBJS)
	ar rcs $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CC) $(CFLAGS) -c $< -o $@
