# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ugdaniel <ugdaniel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/06 11:57:53 by ugdaniel          #+#    #+#              #
#    Updated: 2022/09/02 12:30:16 by ugdaniel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.14

RUN		apk update
RUN		apk upgrade

#==== NGINX ===================================================================#
RUN		apk add nginx

RUN		mkdir -p /var/www/html/

COPY	conf/default.conf /etc/nginx/http.d/default.conf

#==== OPENSSL =================================================================#
RUN		apk add openssl
RUN		mkdir -p /etc/nginx/ssl

RUN		openssl req \
		-newkey rsa:4096 \
		-x509 \
		-sha256 \
		-days 365 \
		-nodes \
		-subj "/C=FR/ST=PACA/L=Nice/O=42/OU=ugdaniel/CN=localhost" \
		-keyout /etc/nginx/ssl/inception.key \
		-out /etc/nginx/ssl/inception.cert

#==== OPENRC ==================================================================#
RUN		apk add openrc
RUN		rc-update add nginx default

#==============================================================================#
EXPOSE	443
CMD		["nginx", "-g", "daemon off;"]
