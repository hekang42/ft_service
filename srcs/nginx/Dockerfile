FROM alpine:3.8
RUN apk update
RUN apk upgrade
RUN apk add --no-cache nginx openssl openssh
RUN openssl req -newkey rsa:4096 -nodes -x509 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -days 365 -subj "/C=KR/L=Seoul/O=42Seoul/OU=hekang/CN=nginx"
RUN	chmod 600 etc/ssl/certs/nginx.crt /etc/ssl/private/nginx.key
RUN	adduser -D -g 'www' www \
&&	mkdir /www \
&&	chown -R www:www /var/lib/nginx \
&&	chown -R www:www /www \
&&	mkdir -p /run/nginx \

COPY ./index.html /www/index.html
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./entrypoint.sh .

RUN	chmod +x entrypoint.sh

EXPOSE 22 80 443

CMD ["./entrypoint.sh"]
