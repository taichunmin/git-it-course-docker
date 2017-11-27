FROM node:latest
LABEL version="2.0" role="git-it-client" maintainer="taichunmin@gmail.com"
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 LANGUAGE=C.UTF-8 REFRESHED_AT=2017-10-02 DEBIAN_FRONTEND=noninteractive

# install software
RUN apt-get -qq update && \
apt-get install -qqy curl git openssh-server nano vim

# install git-it
RUN npm install -g git-it && \
sed -i '/completed = this.getData/a\\n        var exec = require("child_process").exec\n        exec("dashboard-reporter.sh", function(err, stdout, stderr) {})' "$(npm root -g)/git-it/node_modules/workshopper-jlord/workshopper.js" && \
sed -i '/Preferentially/a\\n        var exec = require("child_process").exec\n        exec("dashboard-reporter.sh", function(err, stdout, stderr) {})' "$(npm root -g)/git-it/node_modules/workshopper-jlord/workshopper.js"

# for ssh https://docs.docker.com/engine/examples/running_ssh_service/
RUN mkdir /var/run/sshd && \
echo 'root:git-it' | chpasswd && \
sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
chage -d 0 root
EXPOSE 22

RUN echo '[ ! -z "$TERM" -a -r /etc/motd ] && cat /etc/motd' >> /etc/bash.bashrc && \
    echo '/usr/bin/dashboard-reporter.sh > /dev/null 2>&1' >> /etc/bash.bashrc

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY docker-entrypoint.sh dashboard-reporter.sh /usr/bin/
RUN chmod +x /usr/bin/dashboard-reporter.sh && chmod +x /usr/bin/docker-entrypoint.sh
CMD ["/usr/bin/docker-entrypoint.sh"]
