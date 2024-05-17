FROM alpine:3.17

RUN apk update && apk add --no-cache \
    nginx \
    dumb-init \
    vim \
    openssl \
    psmisc \
    tree

COPY ./conf /etc/nginx/http.d/
COPY ./tools /etc/nginx/scripts/

RUN chmod +x /etc/nginx/scripts/nginxinit.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--", "/etc/nginx/scripts/nginxinit.sh"]

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 443