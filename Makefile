# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ugdaniel <ugdaniel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/01 17:00:41 by ugdaniel          #+#    #+#              #
#    Updated: 2022/09/02 12:57:50 by ugdaniel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: build

build:
	@printf "Creating volumes... "
	@mkdir -p ~/Desktop/data/database
	@mkdir -p ~/Desktop/data/www	
	@printf "Done\n"
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

start:
	@docker-compose -f ./srcs/docker-compose.yml start

stop:
	@docker-compose -f ./srcs/docker-compose.yml stop

list:
	@docker ps -a

status:
	@docker-compose -f ./srcs/docker-compose.yml ps

clean:
	@printf "Stopping containers... "
	@docker-compose -f ./srcs/docker-compose.yml down 2>/dev/null || true
	@-docker stop ${docker ps -qa} 2>/dev/null || true
	@printf "Done\nRemoving containers... "
	@-docker rm ${docker ps -qa} 2>/dev/null || true
	@printf "Done\nRemoving images...     "
	@-docker rmi -f ${docker images -qa} 2>/dev/null || true
	@printf "Done\nRemoving volumes...    "
	@-docker volume rm ${docker volume ls -q} 2>/dev/null || true
	@printf "Done\nRemoving network...    "
	@-docker network rm ${docker network ls -q} 2>/dev/null || true
	@printf "Done\nRemoving data...       "
	@sudo rm -rf ~/Desktop/data
	@printf "Done\n"

prune:
	@printf "Removing unused data..."
	@docker system prune -af | tail -n 1

re: clean build

.PHONY: all build start stop list status clean prune