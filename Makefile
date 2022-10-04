# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ugdaniel <ugdaniel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/01 17:00:41 by ugdaniel          #+#    #+#              #
#    Updated: 2022/10/04 15:52:28 by ugdaniel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: build

build:
	@printf "Creating volumes... "
	@mkdir -p /home/ugdaniel/data/database/ /home/ugdaniel/data/www/
	@printf "Done\n"
	@$(DOCKER_COMPOSE) -f ./srcs/docker-compose.yml up -d --build

start:
	@$(DOCKER_COMPOSE) -f ./srcs/docker-compose.yml start

stop:
	@$(DOCKER_COMPOSE) -f ./srcs/docker-compose.yml stop

list:
	@docker ps -a

status:
	@$(DOCKER_COMPOSE) -f ./srcs/docker-compose.yml ps

clean:
	@printf "Stopping containers... "
	@$(DOCKER_COMPOSE) -f ./srcs/docker-compose.yml down 2>/dev/null || true
	@-docker stop $$(docker ps -qa) 2>/dev/null || true
	@printf "Done\nRemoving containers... "
	@-docker rm $$(docker ps -qa) 2>/dev/null || true
	@printf "Done\nRemoving images...     "
	@-docker rmi -f $$(docker images -qa) 2>/dev/null || true
	@printf "Done\nRemoving volumes...    "
	@docker volume rm $$(docker volume ls -q) 2>/dev/null || true
	@printf "Done\nRemoving network...    "
	@-docker network rm $$(docker network ls -q) 2>/dev/null || true
	@printf "Done\nRemoving data...       "
	@sudo rm -rf ~/data
	@printf "Done\n"

prune:
	@printf "Removing unused data..."
	@docker system prune -af | tail -n 1

fclean: clean prune

re: clean build

hosts:
	@sudo su -c "echo '127.0.0.1	ugdaniel.42.fr' >> /etc/hosts"

.PHONY: all build start stop list status clean prune fclean
