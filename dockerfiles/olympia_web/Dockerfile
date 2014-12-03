FROM ubuntu

MAINTAINER "Jamon Camisso <jamon@jamon.ca>"

ADD requirements /tmp/requirements

# locales, because, locales :(
RUN locale-gen en_US.utf8
RUN update-locale LC_ALL='en_US.utf8'

# Update the base image & get python2.6 in place
RUN apt-get update -qq
RUN apt-get -y install python-software-properties software-properties-common
RUN /usr/bin/apt-add-repository --yes ppa:fkrull/deadsnakes
RUN apt-get update -qq
RUN apt-get -y install python2.6 python2.6-dev

# Upgrade base packages and install main packages
RUN apt-get -y upgrade
RUN apt-get -y install libxml2-dev libxslt1-dev libmysqlclient-dev libssl-dev swig openssl curl libjpeg-dev zlib1g-dev libsasl2-dev wget git build-essential libffi-dev nodejs npm

RUN wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py -O /tmp/get-pip.py
RUN python2.6 /tmp/get-pip.py
RUN rm /tmp/get-pip.py
# older 1.3.1 pip doesn't like git based requirements with specific commits
RUN /usr/local/bin/pip2.6 install --upgrade pip
RUN pip2.6 install virtualenv

RUN virtualenv /opt/olympia
ENV VIRTUAL_ENV /opt/olympia
ENV PATH /opt/olympia/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin
#RUN pip install -r /tmp/requirements/dev.txt
#RUN pip install uwsgi supervisor supervisor-stdout

# Add a user with a home, uid 1000, shell /bin/bash etc.
RUN useradd olympia -u 1000 -s /bin/bash -m
RUN chown olympia:olympia /opt/olympia

RUN apt-get -q -y install mysql-client

RUN ln -sf /usr/bin/nodejs /usr/local/bin/node
ENV NODE_ENV /srv/www/olympia/node_modules

USER olympia
WORKDIR /srv/www/olympia
CMD ["/bin/bash"]
