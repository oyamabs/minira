CC = cc
SANITIZERS = -fsanitize=address,undefined -fno-omit-frame-pointer
ifeq ($(CFLAGS),)
	CFLAGS = -Wall -Wextra -Werror -g
endif
IFLAGS = 

SOURCEFILES = \
		src/main.c \

OBJECTS = $(SOURCEFILES:.c=.o)
NAME = minira 
DEPS = $(OBJECTS:.o=.d)

.PHONY: all clean fclean bonus re sane

all: $(OBJECTS) $(NAME)

-include $(DEPS)

$(NAME): $(OBJECTS)
	$(CC) $(CFLAGS) $(IFLAGS) $(OBJECTS) -o $(NAME)

%.o: %.c
	$(CC) -c $(CFLAGS) $(IFLAGS) -o $*.o $*.c
	$(CC) -MM $(CFLAGS) $(IFLAGS) -MT $*.o $*.c > $*.d

clean:
	find . -name '*.o' -print -delete
	find . -name '*.d' -print -delete

fclean: clean
	rm -f $(NAME)

sane: CFLAGS += $(SANITIZERS)
sane: all

re:
	+make fclean
	+make all
