# COLORS

LAVENDER		=	\x1b[0m\x1b[38;2;199;177;230m
LIGHT_LAVENDER	=	\x1b[0m\x1b[38;2;216;200;238m
DARK_LAVENDER	=	\x1b[1m\x1b[38;2;139;124;161m
WHITE			=	\x1b[0m\x1b[38;2;255;255;255m


# TARGET

NAME			=	Sully


# FLAGS

MAKEFLAGS		+=	-s
CC				=	clang
CFLAGS			=	-Wall -Werror -Wextra -g


# FILES

SRC		=	$(addsuffix .c, $(NAME))
OBJ		=	$(addsuffix .o, $(NAME))


# RULES

all				:	$(NAME)

$(NAME)			:	$(OBJ)
					$(CC) -o $@ $^
					echo -e '$(LIGHT_LAVENDER) \tCompiled$(DARK_LAVENDER) $@$(WHITE)'

clean			:
					$(RM) $(OBJ)
					find . -maxdepth 1 -regextype posix-extended -regex './Sully_[0-9]+(\.c)?' -delete
					echo -e '$(LIGHT_LAVENDER) \tCleaned$(LAVENDER) $(OBJ) $(WHITE)'

fclean			:	clean
					$(RM) $(NAME)
					echo -e '$(LIGHT_LAVENDER) \tCleaned$(DARK_LAVENDER) $(NAME) $(WHITE)'

re				:	fclean all

.PHONY			=	all clean fclean re
