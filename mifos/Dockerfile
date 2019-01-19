FROM tomcat:8.5.30-jre8-alpine

RUN apk add --no-cache mysql-client curl

ADD ./server.xml /usr/local/tomcat/conf/server.xml

ADD ./fineract-provider.war /usr/local/tomcat/webapps/fineract-provider.war

ADD ./community-app/ /usr/local/tomcat/webapps/community-app

ADD ./test/ /usr/local/tomcat/webapps/test/ 

RUN mkdir -p /app .mifosx /root/.mifosx \
	&& cd /app \
	&& wget http://tenet.dl.sourceforge.net/project/mifos/Mifos%20X/mifosplatform-18.03.01.RELEASE.zip \
	&& unzip mifosplatform-18.03.01.RELEASE.zip \
	&& mv fineractplatform-18.03.01.RELEASE/pentahoReports /root/.mifosx \
	&& wget http://central.maven.org/maven2/org/drizzle/jdbc/drizzle-jdbc/1.4/drizzle-jdbc-1.4.jar \
	&& mv drizzle-jdbc-1.4.jar /usr/local/tomcat/lib \
	&& cd / \
	&& rm -rf /app

ADD ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN mkdir -p /run/mysqld \
	&& chown 999 /run/mysqld

RUN ls -lrt /usr/local/tomcat/webapps/
#VOLUME /docker-entrypoint-initdb.d

ENTRYPOINT /entrypoint.sh
