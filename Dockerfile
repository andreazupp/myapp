FROM ubuntu
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y 
RUN apt-get install -y --reinstall apache2 apache2-utils
RUN apt-get install -y libapache2-mod-wsgi-py3
RUN apt-get install -y python3 python3-pip
RUN pip3 install Django==3.0.8
RUN pip3 install psycopg2-binary==2.8.5
ADD ./mysite3_conf.conf /etc/apache2/apache2.conf
CMD ["apache2ctl", "-D", "FOREGROUND"]

