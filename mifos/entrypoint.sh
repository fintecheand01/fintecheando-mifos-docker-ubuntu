#!/bin/bash

keytool -genkey -noprompt -storepass password -keypass password -keyalg RSA -alias tomcat -dname "CN=tomcat" -keystore /usr/share/tomcat.keystore

while ! wget --retry-connrefused --waitretry=5 --read-timeout=20 --timeout=15 -t 10 -O /dev/null "http://admin:admin@sms-server:8161/admin/" ; do
    sleep 2
    echo "Waiting sms service..."
done

while ! mysqladmin --user=root --password=mysql ping -h "db-server" --silent; do
    sleep 2
    echo "Waiting database..."
done

catalina.sh run
