#!/bin/bash

dpkg-reconfigure rabbitmq-server
/usr/sbin/service rabbitmq-server start
printf "\033[1mSetting RabbitMQ permissions and creating olympia queue\033[m\n"

/usr/sbin/rabbitmqctl list_users 2>&1 | grep -q 'olympia'
if [ $? -ne 0 ] ; then
  /usr/sbin/rabbitmqctl add_user olympia olympia
fi

/usr/sbin/rabbitmqctl list_vhosts 2>&1 | grep -q 'olympia'
if [ $? -ne 0 ] ; then
  /usr/sbin/rabbitmqctl add_vhost olympia
fi

/usr/sbin/rabbitmqctl list_permissions -p olympia 2>&1 | grep -v 'vhost' | grep -q 'olympia'
if [ $? -ne 0 ] ; then
  /usr/sbin/rabbitmqctl set_permissions -p olympia olympia '.*' '.*' '.*'
fi

service rabbitmq-server stop

exit
