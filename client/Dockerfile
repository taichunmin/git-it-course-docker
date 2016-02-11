FROM ubuntu:14.04
MAINTAINER Chunmin Tai "taichunmin@gmail.com"
ENV REFRESHED_AT 2016-02-10
LABEL version="1.0" role="git-it-client"

ADD crontab /etc/crontab
ADD client-start.sh /usr/bin/client-start.sh

# install software
RUN apt-get -qq update && \
    apt-get install -qqy nano nodejs npm git openssh-server rsyslog

# link nodejs to node
RUN ln -s /usr/bin/nodejs /usr/bin/node

# install git-it
RUN npm install -g git-it

RUN mkdir /var/run/sshd && \
    echo 'root:git-it' | chpasswd && \
    sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd

RUN chmod +x /usr/bin/client-start.sh
RUN touch /var/log/cron.log

# for ssh https://docs.docker.com/engine/examples/running_ssh_service/
EXPOSE 22

# for git-it config file
VOLUME ["/root/.config/git-it/"]


CMD /usr/bin/client-start.sh
#CMD ["/usr/sbin/sshd", "-D"]

# docker build -t git-it-client client/
# docker run -d -P git-it-client
