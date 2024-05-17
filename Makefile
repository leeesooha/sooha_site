CMD = docker compose
SRC = ./srcs/docker-compose.yml

all :
	$(CMD) -f $(SRC) up -d

clean :
	$(CMD) -f $(SRC) down --rmi "all" --volumes

fclean : clean

re : fclean all

stop :
	$(CMD) -f $(SRC) stop

start : 
	$(CMD) -f $(SRC) start

status :
	$(CMD) -f $(SRC) ps