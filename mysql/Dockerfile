FROM mysql:5.7

RUN apt-get update \
	&& apt-get install -y wget unzip \
	&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /app /docker-entrypoint-initdb.d \
	&& cd /app \
	&& wget http://tenet.dl.sourceforge.net/project/mifos/Mifos%20X/mifosplatform-17.07.01.RELEASE.zip \
	&& unzip mifosplatform-17.07.01.RELEASE.zip \
	&& mv fineractplatform-17.07.01.RELEASE/database/mifospltaform-tenants-first-time-install.sql /docker-entrypoint-initdb.d/ \
	&& sed -i '1s/^/USE mifosplatform-tenants;\n/' /docker-entrypoint-initdb.d/mifospltaform-tenants-first-time-install.sql \
	&& cd / \
	&& rm -rf /app

ADD ./00-create-databases.sql /docker-entrypoint-initdb.d/00-create-databases.sql

VOLUME /docker-entrypoint-initdb.d
