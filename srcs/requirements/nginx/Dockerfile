# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ugdaniel <ugdaniel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/06 11:57:53 by ugdaniel          #+#    #+#              #
#    Updated: 2022/09/08 19:32:36 by ugdaniel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.15

RUN		apk update && apk upgrade
RUN		apk add nginx

RUN		mkdir -p /var/www/html/
COPY	conf/default.conf /etc/nginx/http.d/default.conf

RUN		apk add openssl
RUN		mkdir -p /etc/nginx/ssl

RUN		openssl req \
		-newkey rsa:4096 \
		-x509 \
		-sha256 \
		-days 365 \
		-nodes \
		-subj "/C=FR/ST=Paris/L=Paris/O=42/CN=ugdaniel.42.fr" \
		-keyout /etc/nginx/ssl/inception.key \
		-out /etc/nginx/ssl/inception.cert

EXPOSE	443

CMD		["nginx", "-g", "daemon off;"]
