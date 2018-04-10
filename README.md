# Mifos X 18.03.01 - Docker - FinTECHeando

1. Run Mifos X pulling Docker images.

```bash
$ docker-compose up
```

# Or

1. Build the MIFOS X image

```bash
$ docker build -t com.mx.fintecheando.mifosx.18.03.01 .
```

2. Build the MariaDB image

```bash
$ docker build -t com.mx.fintecheando.mariadb.mifosx.18.03.01 .
```

3. Build the MySQL image (optional, please change the name of the image in the mifos-stack.yml from MariaDB to MySQL)

```bash
$ docker build -t com.mx.fintecheando.mysql.mifosx.18.03.01 .
```

4. Build the SMS Server image

```bash
$ docker build -t com.mx.fintecheando.activemq.mifosx.18.03.01 .
```

5. Run the Docker images using Compose

```bash
$ docker-compose -f mifos-stack-DEV.yml up
```

6. Verify the running containers

```bash
$ docker ps | grep mifosx.18.03.01
588027cda597        fintecheando/com.mx.fintecheando.mifosx.18.03.01            "/bin/sh -c /entrypo…"   41 minutes ago      Up 41 minutes       8080/tcp, 0.0.0.0:8443->8443/tcp                           fintecheandomifosdockerubuntu_mifosx_1
0a4c69071ae0        fintecheando/com.mx.fintecheando.mariadb.mifosx.18.03.01    "docker-entrypoint.s…"   41 minutes ago      Up 41 minutes       3306/tcp                                                   fintecheandomifosdockerubuntu_db-server_1
3a4f14d027d2        fintecheando/com.mx.fintecheando.activemq.mifosx.18.03.01   "/app/run.sh"            41 minutes ago      Up 41 minutes       1883/tcp, 5672/tcp, 8161/tcp, 61613-61614/tcp, 61616/tcp   fintecheandomifosdockerubuntu_sms-server_1
```

7. Login to Mifos using the Web UI with these credentials:

username: mifos
password: password

https://localhost:8443/community-app/#/ (secure web access, but this is a self signed certificate and you will have a warning in your web explorer, just ignore it and continue)


8. As note if you have any issue with the volumes and entry points remove the volumes (be careful, with this we are removing all of them, because it is running in our local DEV, don't do this in Production)
```bash
$ docker stop $(docker ps -a -q)
$ docker rm $(docker ps -a -q)
$ docker volume rm $(docker volume ls -q)
```

Reference 

* http://mifos.org/take-action/get-mifos/#download
* https://mifosforge.jira.com/wiki/spaces/docs/pages/74711072/Mifos+X+Installation+on+Linux+-+Ubuntu+Server 
* https://github.com/dmitryint/docker-mifosx
* https://github.com/docker-library/docs/tree/master/mariadb
* https://docs.docker.com/docker-cloud/builds/push-images/
* https://issues.apache.org/jira/secure/ReleaseNote.jspa?version=12340624&styleName=&projectId=12319420&Create=Create&atl_token=A5KQ-2QAV-T4JA-FDED%7C7616978f36b22cf7dc20a899a3cbf9f614960808%7Clin
* https://medium.com/viithiisys/mifos-x-installation-on-linux-ubuntu-server-3843e028ab90