# This docker file will have apache2 and the soultion will be hosted on it

FROM ubuntu

RUN apt-get update -y
RUN apt-get install apache2 -y

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_RUN_DIR /var/www/html
ENV APACHE_PID_FILE /var/run/apache2/apache2$SUFFIX.pid


COPY appCode /var/www/html/

EXPOSE 80
      
WORKDIR /etc/apache2

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
