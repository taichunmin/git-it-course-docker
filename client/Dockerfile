FROM node:latest
LABEL maintainer="taichunmin@gmail.com"
LABEL role="git-it-client"
ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22

COPY docker-entrypoint.sh dashboard-reporter.sh /usr/bin/

# install software
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    openssh-server \
    nano \
    vim \
 && rm -rf /var/lib/apt/lists/* \
# install git-it
 && npm install -g git-it \
 && sed -i '/completed = this.getData/a\\n        var exec = require("child_process").exec\n        exec("dashboard-reporter.sh", function(err, stdout, stderr) {})' "$(npm root -g)/git-it/node_modules/workshopper-jlord/workshopper.js" \
 && sed -i '/Preferentially/a\\n        var exec = require("child_process").exec\n        exec("dashboard-reporter.sh", function(err, stdout, stderr) {})' "$(npm root -g)/git-it/node_modules/workshopper-jlord/workshopper.js" \
# for ssh https://docs.docker.com/engine/examples/running_ssh_service/
 && mkdir /var/run/sshd \
 && echo 'root:git-it' | chpasswd \
 && sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
 && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
 && chage -d 0 root \
# display welcome message
 && echo '[ ! -z "$TERM" -a -r /etc/motd ] && cat /etc/motd' >> /etc/bash.bashrc \
 && echo '/usr/bin/dashboard-reporter.sh > /dev/null 2>&1' >> /etc/bash.bashrc \
# chmod +x
 && chmod +x /usr/bin/dashboard-reporter.sh \
 && chmod +x /usr/bin/docker-entrypoint.sh

CMD ["/usr/bin/docker-entrypoint.sh"]
