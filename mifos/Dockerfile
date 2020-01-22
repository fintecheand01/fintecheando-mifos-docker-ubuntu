FROM tomcat:8.5.30-jre8-alpine

RUN apk add --no-cache mysql-client curl

ADD ./server.xml /usr/local/tomcat/conf/server.xml

ADD ./fineract-provider.war /usr/local/tomcat/webapps/fineract-provider.war

ADD ./community-app/ /usr/local/tomcat/webapps/community-app

ADD ./test/ /usr/local/tomcat/webapps/test/ 

RUN mkdir -p /app .mifosx /root/.mifosx 

ADD ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN mkdir -p /run/mysqld \
	&& chown 999 /run/mysqld

RUN ls -lrt /usr/local/tomcat/webapps/
#VOLUME /docker-entrypoint-initdb.d

ENTRYPOINT /entrypoint.sh
