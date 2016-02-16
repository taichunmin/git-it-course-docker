FROM ubuntu:14.04
MAINTAINER Chunmin Tai "taichunmin@gmail.com"
ENV REFRESHED_AT 2016-02-10
LABEL version="1.0" role="git-it-client"

ADD scoreboard-reporter.sh /usr/bin/scoreboard-reporter.sh
RUN chmod +x /usr/bin/scoreboard-reporter.sh

# install software
RUN apt-get -qq update && \
apt-get upgrade -y && \
apt-get install -qqy nano nodejs npm git openssh-server curl vim

# link nodejs to node
RUN ln -s /usr/bin/nodejs /usr/bin/node

# install git-it
RUN npm install -g git-it && \
sed -i '/completed = this.getData/a\\n        var exec = require("child_process").exec\n        exec("scoreboard-reporter.sh", function(err, stdout, stderr) {})' /usr/local/lib/node_modules/git-it/node_modules/workshopper-jlord/workshopper.js

RUN mkdir /var/run/sshd && \
echo 'root:git-it' | chpasswd && \
sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd

# for ssh https://docs.docker.com/engine/examples/running_ssh_service/
EXPOSE 22

CMD /usr/sbin/sshd -D
