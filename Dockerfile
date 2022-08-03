FROM php:8.0-apache
WORKDIR /var/www/html

COPY index.php index.php
COPY index.html index.html
RUN apt update -y
RUN apt upgrade -y
RUN apt install ffmpeg -y
RUN ffmpeg -i https://lightning-traceurban-samsungau.amagi.tv/playlist.m3u8 -y -vn -b:a 64k -f hls -hls_list_size 5 -hls_time 2 -hls_delete_threshold 1 -hls_flags delete_segments trace.m3u8 &
EXPOSE 80
