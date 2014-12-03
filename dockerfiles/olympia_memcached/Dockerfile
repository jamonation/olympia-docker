FROM ubuntu
MAINTAINER Jamon Camisso <jamon@jamon.ca>
RUN apt-get -q -y update
RUN apt-get -q -y dist-upgrade
RUN apt-get -q -y install memcached
EXPOSE 11211
CMD ["/usr/bin/memcached","-p","11211","-u","memcache","-m","64","-c","1024","-l","0.0.0.0"]
