#!/bin/bash

DEBIAN_FRONTEND=noninteractive
dpkg-reconfigure mysql-server-5.5
/usr/sbin/service mysql start
printf "\033[1mSetting MySQL permissions\033[m\n"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS olympia;"
mysql -u root -e "GRANT ALL on olympia.* to olympia_user@'%' IDENTIFIED BY 'olympia';"
mysql -u root -e "FLUSH PRIVILEGES;"
exit
