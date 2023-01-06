FROM nginx:latest

ENV NGINX_CONF_PATH /etc/nginx/

RUN mkdir -p /tmp/nil

WORKDIR /

COPY ./nginx.conf $NGINX_CONF_PATH

EXPOSE 80

# ENTRYPOINT ["nginx", "-c", "/etc/nginx/nginx.conf"]