SRCS=util.c algorithm.c io.c main.c
OBJS=$(SRCS:.c=.o)
SRCDIR=src
BINDIR=bin
INCLUDES_DIR=includes
DEPDIR=dep
OBJS_COMP=$(addprefix $(BINDIR)/, $(OBJS))
DEP_FILES=$(addprefix $(DEPDIR)/, $(SRCS:.c=.d))
	
all: lab01

lab01: $(OBJS_COMP)
	gcc $(OBJS_COMP) -o lab01

$(BINDIR)/%.o: $(SRCDIR)/%.c
	gcc -I$(INCLUDES_DIR) -MMD -MF $(DEPDIR)/$*.d -c $(SRCDIR)/$*.c -o $(BINDIR)/$*.o

-include $(DEP_FILES)