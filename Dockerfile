FROM tomcat:jre8

ADD ./server.xml /usr/local/tomcat/conf/server.xml
ADD ./00-create-databases.sql /docker-entrypoint-initdb.d/00-create-databases.sql
ADD ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN apt-get update \
	&& apt-get install -y mysql-client \
	&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /run/mysqld \
	&& chown 999 /run/mysqld

RUN mkdir -p /app /docker-entrypoint-initdb.d /root/.mifosx \
	&& cd /app \
	&& wget http://tenet.dl.sourceforge.net/project/mifos/Mifos%20X/fineractplatform-16.03.03.RELEASE.zip \
	&& unzip fineractplatform-16.03.03.RELEASE.zip \
	&& mv fineractplatform-16.03.03.RELEASE/fineract-provider.war /usr/local/tomcat/webapps/ \
	&& mv fineractplatform-16.03.03.RELEASE/apps/community-app /usr/local/tomcat/webapps/ \
	&& mv fineractplatform-16.03.03.RELEASE/database/mifospltaform-tenants-first-time-install.sql /docker-entrypoint-initdb.d/ \
	&& mv fineractplatform-16.03.03.RELEASE/pentahoReports /root/.mifosx \
	&& sed -i '1s/^/USE mifosplatform-tenants;\n/' /docker-entrypoint-initdb.d/mifospltaform-tenants-first-time-install.sql \
	&& wget http://central.maven.org/maven2/org/drizzle/jdbc/drizzle-jdbc/1.3/drizzle-jdbc-1.3.jar \
	&& mv drizzle-jdbc-1.3.jar /usr/local/tomcat/lib \
	&& cd / \
	&& rm -rf /app

VOLUME /docker-entrypoint-initdb.d
ENTRYPOINT /entrypoint.sh
