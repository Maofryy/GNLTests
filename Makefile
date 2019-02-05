CC = gcc
CFLAGS = -Wall -Wextra -Werror

SRC_PATH =

OBJ_PATH =

CPPFLAGS = -Ilibft/includes

LDFLAGS = -Llibft
LDLIBS = -lft
LDLIB = libft.a

NAME = main.out

SRC_NAME = get_next_line.c main.c

OBJ_NAME = $(SRC_NAME:.c=.o)

SRC = $(addprefix $(SRC_PATH),$(SRC_NAME))
OBJ = $(addprefix $(OBJ_PATH),$(OBJ_NAME))

GREEN = \033[0;32m
RED = \033[0;31m
WHITE = \033[0m

all : $(NAME)

$(NAME) : lib $(OBJ) 
	@$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(LDLIBS) $(OBJ) -o $@
	@$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(LDLIBS) ret.c get_next_line.o -o ret.out
	@$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(LDLIBS) testerror.c get_next_line.o -o error.out

%.o: %.c
	@$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -c $<
	@echo "$(GREEN)$@$(WHITE)"

lib : 
ifeq ($(findstring libft.a,$(shell ls libft)),$(LDLIB))
	@echo "$(GREEN)libft already compiled.$(WHITE)"
else
	@make -C libft re && echo "$(GREEN)libft compiled successfully$(WHITE)"
endif

run : 
	@sh checker.sh

vrun :
	@sh checker.sh -v

clean :
	@make -C libft clean
	@rm -f $(OBJ) && echo "$(RED)objects successfully deleted$(WHITE)"

fclean : clean
	@make -C libft fclean
	@rm -f $(NAME) error.out ret.out && echo "$(RED)$(NAME) ret.out error.out deleted$(WHITE)"

re : fclean all

.PHONY : all clean fclean re lib

norme:
	norminette $(SRC)
	norminette $(INC_PATH)*.h
