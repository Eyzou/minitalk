CC = cc
CFLAGS = -Wall -Wextra -Werror
LIBFT = ./libft/libft.a
RM = rm -rf

SERVER = server
CLIENT = client

SV_SRCS = srcs/server.c
SV_OBJS = $(SV_SRCS:.c=.o)

CLIENT_SRCS = srcs/client.c
CLIENT_OBJS = $(CLIENT_SRCS:.c=.o)

all: $(SERVER) $(CLIENT)

$(LIBFT):
	$(MAKE) -C ./libft
$(SERVER): $(SV_OBJS) $(LIBFT)
	$(CC) $(CFLAGS) $(SV_OBJS) $(LIBFT) -o server
$(CLIENT): $(CLIENT_OBJS) $(LIBFT)
	$(CC) $(CFLAGS) $(CLIENT_OBJS) $(LIBFT) -o client

clean:
	$(MAKE) clean -C ./libft
	$(RM) $(SV_OBJS) $(CLIENT_OBJS)

fclean: clean
	$(MAKE) fclean -C ./libft
	$(RM) $(SERVER) $(CLIENT)

re: fclean all

.PHONY: all clean fclean re