FROM nginx:1.17

ENV DATA_DIR=/var/www
ENV FPM_HOST=127.0.0.1

ADD start_nginx.sh /usr/local/bin/
ADD conf /etc/nginx/conf.d/

RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
    mkdir -p $DATA_DIR && \
    chmod 777 /usr/local/bin/start_nginx.sh && \
    chown -R www-data:www-data $DATA_DIR

EXPOSE 80

CMD ["/usr/local/bin/start_nginx.sh"]
