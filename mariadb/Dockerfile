FROM mariadb:10

RUN apt-get update \
	&& apt-get install -y wget unzip \
	&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /docker-entrypoint-initdb.d 	&& cd / 

ADD ./00-create-databases.sql /docker-entrypoint-initdb.d/00-create-databases.sql

VOLUME /docker-entrypoint-initdb.d
