FROM mariadb:5.5

RUN apt-get update \
	&& apt-get install -y wget unzip \
	&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /docker-entrypoint-initdb.d 	&& cd / 

ADD ./00-create-databases.sql /docker-entrypoint-initdb.d/00-create-databases.sql

ADD ./01-mifospltaform-tenants-first-time-install.sql /docker-entrypoint-initdb.d/01-mifospltaform-tenants-first-time-install.sql

ADD ./02-load_sample_data.sql /docker-entrypoint-initdb.d/02-load_sample_data.sql

VOLUME /docker-entrypoint-initdb.d
