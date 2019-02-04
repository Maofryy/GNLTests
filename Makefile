CC = gcc
CFLAGS = -Wall -Wextra -Werror

SRC_PATH =

OBJ_PATH =

CPPFLAGS = -Ilibft/includes

LDFLAGS = -Llibft
LDLIBS = -lft

NAME = main.out

SRC_NAME = get_next_line.c

OBJ_NAME = $(SRC_NAME:.c=.o)

SRC = $(addprefix $(SRC_PATH),$(SRC_NAME))
OBJ = $(addprefix $(OBJ_PATH),$(OBJ_NAME))

GREEN = \033[0;32m
RED = \033[0;31m
WHITE = \033[0m

all : $(NAME)

$(NAME) : $(OBJ)
	@make -C libft re && echo "$(GREEN)libft compiled successfully$(WHITE)"
	@$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(LDLIBS) main.c $(SRC) -o $@
	@$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(LDLIBS) testerror.c $(SRC) -o error.out
%.o: %.c
	@$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -c $<
	@echo "$(GREEN)$@$(WHITE)"

clean :
	@make -C libft clean
	@rm -f $(OBJ) && echo "$(RED)objects successfully deleted$(WHITE)"

fclean : clean
	@make -C libft fclean
	@rm -f $(NAME) && echo "$(RED)$(NAME) deleted$(WHITE)"

re : fclean all

.PHONY : all clean fclean re

norme:
	norminette $(SRC)
	norminette $(INC_PATH)*.h
