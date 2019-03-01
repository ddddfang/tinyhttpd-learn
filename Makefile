MODULE_BIN = httpd
#MODULE_OBJS += $(patsubst %.c,%.o ,$(wildcard ./*.c))
MODULE_OBJS += $(patsubst %.c,%.o ,$(wildcard ./httpd.c))
MODULE_OBJS += $(patsubst %.c, %.o, $(wildcard easylogger/src/*.c))
MODULE_OBJS += $(patsubst %.c, %.o, $(wildcard easylogger/port/*.c))
MODULE_OBJS += $(patsubst %.c, %.o, $(wildcard easylogger/plugins/file/*.c))

CC = gcc
OUT_DIR = .
PUBLIC_FLAGS:=-g -O0 -Wall
LDFLAGS = -lm -lz -lpthread
MODULE_INCLUDE = -I. -I./easylogger/inc -I./easylogger/plugins

.PHONY:all clean

%.o: %.c
	$(CC) $(PUBLIC_FLAGS) $(MODULE_INCLUDE) -c $< -o $@

all : clean $(MODULE_OBJS)
	$(CC) $(MODULE_OBJS) $(PUBLIC_FLAGS) $(LDFLAGS) -o $(OUT_DIR)/$(MODULE_BIN)
	$(CC) simpleclient.c $(PUBLIC_FLAGS) $(LDFLAGS) -o $(OUT_DIR)/simpleclient

clean:
	-rm -f $(MODULE_OBJS)
	-rm -f $(MODULE_BIN) simpleclient
