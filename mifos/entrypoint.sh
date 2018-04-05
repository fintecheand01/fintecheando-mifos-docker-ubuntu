#!/bin/bash

keytool -genkey -noprompt -storepass password -keypass password -keyalg RSA -alias tomcat -dname "CN=tomcat" -keystore /usr/share/tomcat.keystore

while ! mysqladmin --user=root --password=mysql ping -h "db-server" --silent; do
    sleep 2
    echo "Waiting database..."
done

catalina.sh run

