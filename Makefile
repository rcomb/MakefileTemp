
NAME =		

SRC =		./src/

OBJ = $(SRC:.c=.o)

HEADER_DIR=	.

FLAGS = -Wall -Werror -Wextra

LIBFT = ./libft/libft.a
LIBFTLINK = -L./libft/ -lft

.PHONY: all clean fclean re

all: $(NAME)

libft: $(LIBFT)

$(OBJ): $(SRC)
	gcc $(FLAGS) -c $(SRC) -I$(HEADER_DIR)
	@mv *.o 	./src/

$(LIBFT):
	make -C ./libft

$(NAME): $(LIBFT) $(OBJ)
	gcc $(OBJ) -o $(NAME) $(LIBFTLINK)

clean:
	/bin/rm -f $(OBJ)

fclean: clean
	/bin/rm -f $(NAME)
	make fclean -C ./libft/

re: fclean all
