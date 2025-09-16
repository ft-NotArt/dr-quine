# COLORS

LAVENDER		=	\x1b[0m\x1b[38;2;199;177;230m
LIGHT_LAVENDER	=	\x1b[0m\x1b[38;2;216;200;238m
DARK_LAVENDER	=	\x1b[1m\x1b[38;2;139;124;161m
WHITE			=	\x1b[0m\x1b[38;2;255;255;255m


# TARGET

NAME			=	Grace


# FLAGS

MAKEFLAGS		+=	-s
AS				=	nasm
ASFLAGS			=	-f elf64 -g
CC				=	gcc
LDFLAGS			=	-no-pie


# FILES

SRC				=	$(addsuffix .s, $(NAME))
OBJ				=	$(addsuffix .o, $(NAME))


# RULES

all				:	$(NAME)

$(NAME)			:	$(OBJ)
					$(CC) $(OBJ) -o $@ $(LDFLAGS)
					echo -e '$(LIGHT_LAVENDER) \tCompiled$(DARK_LAVENDER) $@$(WHITE)'

clean			:
					$(RM) $(OBJ) Grace_kid.s
					echo -e '$(LIGHT_LAVENDER) \tCleaned$(LAVENDER) $(OBJ) & Grace_kid.s $(WHITE)'

fclean			:	clean
					$(RM) $(NAME)
					echo -e '$(LIGHT_LAVENDER) \tCleaned$(DARK_LAVENDER) $(NAME)$(WHITE)'

re				:	fclean all

.PHONY			=	all clean fclean re
