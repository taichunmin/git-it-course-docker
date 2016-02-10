FROM ubuntu:14.04
MAINTAINER Chunmin Tai "taichunmin@gmail.com"
ENV REFRESHED_AT 2016-02-10
LABEL version="1.0" role="git-it-client"
COPY client-ssh.pub /root/client-ssh.pub
RUN apt-get -qq update && \
    apt-get install -y nano
EXPOSE 22
VOLUME ["/data"]
ENTRYPOINT ["/bin/bash"]
CMD ["-l"]
