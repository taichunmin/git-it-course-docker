FROM ubuntu:14.04
MAINTAINER Chunmin Tai "taichunmin@gmail.com"
ENV REFRESHED_AT 2016-02-10
LABEL version="1.0" role="git-it-client"
COPY client-ssh.pub /root/client-ssh.pub
RUN apt-get -qq update && \
    apt-get install -y nano nodejs npm git
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g git-it

EXPOSE 22
VOLUME ["/data", "/root/.config/git-it/"]
ENTRYPOINT ["/bin/bash"]
CMD ["-l"]
