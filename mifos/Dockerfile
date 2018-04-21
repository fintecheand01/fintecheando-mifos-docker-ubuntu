FROM tomcat:jre8

ADD ./server.xml /usr/local/tomcat/conf/server.xml

ADD ./fineract-provider.war /usr/local/tomcat/webapps/fineract-provider.war

ADD ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN apt-get update \
	&& apt-get install -y mysql-client \
	&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /run/mysqld \
	&& chown 999 /run/mysqld

RUN mkdir -p /app /docker-entrypoint-initdb.d /root/.mifosx \
	&& cd /app \
	&& wget http://tenet.dl.sourceforge.net/project/mifos/Mifos%20X/mifosplatform-18.03.01.RELEASE.zip \
	&& unzip mifosplatform-18.03.01.RELEASE.zip \
	&& mv fineractplatform-18.03.01.RELEASE/pentahoReports /root/.mifosx \
	&& wget http://central.maven.org/maven2/org/drizzle/jdbc/drizzle-jdbc/1.4/drizzle-jdbc-1.4.jar \
	&& mv drizzle-jdbc-1.4.jar /usr/local/tomcat/lib \
	&& cd / \
	&& rm -rf /app
	
ADD ./community-app.zip /usr/local/tomcat/webapps/community-app.zip 

RUN	cd /usr/local/tomcat/webapps \
	&& unzip community-app.zip \
	&& mv /usr/local/tomcat/webapps/app	/usr/local/tomcat/webapps/community-app \
	&& rm -Rf /usr/local/tomcat/webapps/community-app.zip  \
	&& ls -lrt  /usr/local/tomcat/webapps/community-app/

ADD ./test/ /usr/local/tomcat/webapps/test/ 

VOLUME /docker-entrypoint-initdb.d

ENTRYPOINT /entrypoint.sh
