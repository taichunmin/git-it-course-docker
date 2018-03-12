FROM node:latest
LABEL maintainer="taichunmin@gmail.com"
LABEL role="git-it-dashboard"

EXPOSE 80
WORKDIR /var/www/html

RUN echo '[ ! -z "$TERM" -a -r /etc/motd ] && cat /etc/motd' >> /etc/bash.bashrc

CMD ["node", "./bin/www"]
