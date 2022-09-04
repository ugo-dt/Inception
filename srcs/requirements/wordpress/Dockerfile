FROM	alpine:3.15

RUN		apk update
RUN		apk upgrade

#==== PHP_FPM =================================================================#
RUN		apk add php7 \
				php7-fpm \
				php7-opcache \
				php7-mysqli \
				php7-session \
				php7-iconv \
				php7-json \
				php7-gd \
				php7-curl \
				php7-xml \
				php7-common \
				php7-imap \
				php7-cgi \
				php7-ldap \
				php7-ctype \
				php7-dom \
				php7-phar

RUN		apk add curl wget

RUN rm -rf /etc/php6/php-fpm.d/www.conf
COPY conf/default.conf /etc/php7/php-fpm.d/www.conf

RUN mkdir -p /var/www/html
RUN adduser -u 82 -D -S -G www-data www-data
RUN chmod 777 -R /var/www/html
RUN chown -R www-data:www-data /var/www/html

COPY ./conf/wp-config.php ./
COPY ./conf/entrypoint.sh ./
RUN chmod +x ./entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]


EXPOSE	9000
