FROM alpine:3.17

RUN apk update && apk add --no-cache \
    nginx \
    dumb-init \
    vim \
    openssl \
    psmisc \
    tree

COPY ./conf /etc/nginx/sites-available/
COPY ./tools /etc/nginx/scripts/
COPY ./html /var/lib/nginx/html/

RUN chmod +x /etc/nginx/scripts/nginxinit.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--", "/etc/nginx/scripts/nginxinit.sh"]

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80