# Mifos X 19.07 - Docker - FinTECHeando

1. Just run Docker compose to get Mifos X 19.07 up and running.

```bash
$ docker-compose up
```

# Or build the images

1. Build the MIFOS X image

```bash
$ docker build -t com.mx.fintecheando.tomcat.mifosx.19.07 .
```

2. Build the MySQL image 

```bash
$ docker build -t com.mx.fintecheando.mysql.mifosx.19.07 .
```

3. Build the SMS Server image

```bash
$ docker build -t com.mx.fintecheando.activemq.mifosx.19.07 .
```

4. Run the Docker images using Compose

```bash
$ docker-compose -f mifos-stack-DEV.yml up
```

5. Verify the running containers

```bash
$ docker ps | grep mifosx.19.07
```

6. Login to Mifos using the Web UI with these credentials:

username: mifos
password: password

https://localhost:8443/community-app/#/ (secure web access, but this is a self signed certificate and you will have a warning in your web explorer, just ignore it and continue)


7. As note if you have any issue with the volumes and entry points remove the volumes (be careful, with this we are removing all of them, because it is running in our local DEV, don't do this in Production)
```bash
$ docker stop $(docker ps -a -q)
$ docker rm $(docker ps -a -q)
$ docker volume rm $(docker volume ls -q)
```

Reference 

* http://mifos.org/take-action/get-mifos/#download
* https://mifosforge.jira.com/wiki/spaces/MDZ/pages/92504091/Prerequisite
* https://mifosforge.jira.com/wiki/spaces/docs/pages/74711072/Mifos+X+Installation+on+Linux+-+Ubuntu+Server 
* https://github.com/dmitryint/docker-mifosx
* https://github.com/docker-library/docs/tree/master/mariadb
* https://docs.docker.com/docker-cloud/builds/push-images/
* https://issues.apache.org/jira/secure/ReleaseNote.jspa?version=12340624&styleName=&projectId=12319420&Create=Create&atl_token=A5KQ-2QAV-T4JA-FDED%7C7616978f36b22cf7dc20a899a3cbf9f614960808%7Clin
* https://medium.com/viithiisys/mifos-x-installation-on-linux-ubuntu-server-3843e028ab90

Issues with the reports
* https://stackoverflow.com/questions/37066024/what-is-the-mariadb-dialect-class-name-for-hibernate
* http://sterl.org/2015/09/spring-boot-mariadb/
* http://in.relation.to/2017/02/16/mariadb-dialects/
