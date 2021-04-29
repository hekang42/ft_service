FROM alpine:latest

COPY nginx.conf index.html setup.sh ./

# install nginx and dependencies
RUN apk update && \
	apk add --no-cache nginx openssh openssl

# Setup nginx
RUN mkdir -p /run/nginx www && \
		mv nginx.conf /etc/nginx/ && \
		mv index.html /www/

# Setup SSL
RUN openssl req -new -newkey rsa:2048 -nodes -days 365 -x509 \
		-subj "/C=KR/L=Seoul/O=42Seoul/OU=hekang/CN=nginx" \
		-keyout /etc/ssl/private/services.key -out /etc/ssl/certs/services.crt

# Setup SSH
RUN ssh-keygen -A && \
	adduser -D ssh_admin && \
	echo "ssh_admin:hekang" | chpasswd

EXPOSE 22 80 443

CMD ./setup.sh
