FROM php:8.0-apache
WORKDIR /var/www/html

COPY index.php index.php
COPY index.html index.html
RUN apt update -y
RUN apt upgrade -y
RUN apt install ffmpeg -y
EXPOSE 80
