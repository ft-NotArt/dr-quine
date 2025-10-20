# COLORS

LAVENDER		=	\x1b[0m\x1b[38;2;199;177;230m
LIGHT_LAVENDER	=	\x1b[0m\x1b[38;2;216;200;238m
DARK_LAVENDER	=	\x1b[1m\x1b[38;2;139;124;161m
WHITE			=	\x1b[0m\x1b[38;2;255;255;255m


# TARGET

NAME			=	Colleen


# FLAGS

MAKEFLAGS		+=	-s
RS				=	rustc


# FILES

SRC		=	$(addsuffix .rs, $(NAME))


# RULES

all				:	$(NAME)

$(NAME)			:	$(SRC)
					$(RS) -o $@ $^
					echo -e '$(LIGHT_LAVENDER) \tCompiled$(DARK_LAVENDER) $@$(WHITE)'

fclean			:
					$(RM) $(NAME)
					echo -e '$(LIGHT_LAVENDER) \tCleaned$(DARK_LAVENDER) $(NAME) $(WHITE)'

re				:	fclean all

.PHONY			=	all clean fclean re
