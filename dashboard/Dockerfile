FROM node:latest
LABEL version="2.0" role="git-it-dashboard" maintainer="taichunmin@gmail.com"
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 LANGUAGE=C.UTF-8 REFRESHED_AT=2017-10-02 DEBIAN_FRONTEND=noninteractive

WORKDIR /var/www/html

# install software
RUN apt-get -qq update && \
apt-get install -qqy nano vim && \
yarn global add nodemon forever

RUN echo '[ ! -z "$TERM" -a -r /etc/motd ] && cat /etc/motd' >> /etc/bash.bashrc

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80

COPY docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh
CMD ["/usr/bin/docker-entrypoint.sh"]
