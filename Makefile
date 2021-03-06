NAME ?= xlib-escape-key-hack
BUILD_DIR ?= ./build/
DEBUG ?= 0

ifeq ($(DEBUG),1)
	DEBUG_FLAG = -D DEBUG
else
	DEBUG_FLAG =
endif

$(NAME): clean
	mkdir "$(BUILD_DIR)"
	gcc \
		./src/main.c \
		-lX11 -lXtst \
		-std=c99 \
		$(DEBUG_FLAG) \
		-o "$(BUILD_DIR)/$(NAME)"

clean:
	rm -rf "$(BUILD_DIR)"

all: $(NAME)
