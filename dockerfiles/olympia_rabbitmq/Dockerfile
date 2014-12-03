FROM ubuntu

MAINTAINER Jamon Camisso <jamon@jamon.ca>

VOLUME /var/lib/rabbitmq

# Don't prompt for input. Not recommended but mysql setup necessitates
# http://docs.docker.com/reference/builder/#env
# http://docs.docker.com/faq/#why-is-debian_frontendnoninteractive-discouraged-in-dockerfiles
ENV DEBIAN_FRONTEND noninteractive

# Need this for rabbitmq, which relies on consistent hostname
# See https://intercityup.com/blog/persisting-rabbitmq-settings-changes-during-dockerfile-build/
ENV HOSTNAME rabbitmq

RUN apt-get -q -y update
RUN apt-get -q -y dist-upgrade
RUN apt-get -q -y install rabbitmq-server supervisor libreadline6

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD provision_rabbitmq.sh /usr/local/bin/provision_rabbitmq.sh
RUN chmod 775 /usr/local/bin/provision_rabbitmq.sh

RUN echo "NODENAME=olympia@rabbitmq" > /etc/rabbitmq/rabbitmq-env.conf

EXPOSE 5672

# Make default newt DEBIAN_FRONTEND again
ENV DEBIAN_FRONTEND readline

CMD ["/usr/sbin/rabbitmq-server"]
