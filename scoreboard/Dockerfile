FROM ubuntu:14.04
MAINTAINER Chunmin Tai "taichunmin@gmail.com"
ENV REFRESHED_AT 2016-02-10
LABEL version="1.0" role="git-it-scoreboard"

ADD scoreboard-start.sh /usr/bin/scoreboard-start.sh
RUN chmod +x /usr/bin/scoreboard-start.sh

# install software
RUN apt-get -qq update && \
apt-get upgrade -y && \
apt-get install -qqy build-essential tcl8.5 php5 git wget php5-json libapache2-mod-php5 openssh-server

RUN mkdir /var/run/sshd && \
echo 'root:scoreboard' | chpasswd && \
sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd

# install redis https://github.com/dockerfile/redis/blob/master/Dockerfile
RUN cd /tmp && \
wget http://download.redis.io/redis-stable.tar.gz && \
tar xvzf redis-stable.tar.gz && \
cd redis-stable && \
make && \
make install && \
cp -f src/redis-sentinel /usr/local/bin && \
mkdir -p /etc/redis && \
cp -f *.conf /etc/redis && \
rm -rf /tmp/redis-stable* && \
sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis/redis.conf

# install composer
RUN cd /root/ && \
php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php && \
php composer-setup.php --install-dir=/bin --filename=composer && \
php -r "unlink('composer-setup.php');"

# clone scoreboard source code
RUN cd /var/www && \
git clone https://github.com/taichunmin/git-it-course-scoreboard.git && \
cd /var/www/git-it-course-scoreboard && \
composer install && \
chmod -R a+rw storage && \
chmod -R a+rw bootstrap/cache && \
cp .env.example .env

# modify apache setting
RUN sed -ri 's#DocumentRoot /var/www/html$#DocumentRoot /var/www/git-it-course-scoreboard/public#' /etc/apache2/sites-enabled/000-default.conf && \
sed -ri 's/^display_errors\s*=\s*Off/display_errors = On/g' /etc/php5/apache2/php.ini && \
sed -ri 's/^display_errors\s*=\s*Off/display_errors = On/g' /etc/php5/cli/php.ini && \
sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf && \
a2enmod rewrite

EXPOSE 22 80
CMD /usr/bin/scoreboard-start.sh
