# Fintecheando - Mifos X 17.07.01

1. Build the MIFOS X image

```bash
$ docker build -t com.mx.fintecheando.mifosx.17.07.01 .
```

2. Build the MariaDB image

```bash
$ docker build -t com.mx.fintecheando.mariadb.mifosx.17.07.01 .
```

3. Build the MySQL image (optional, please change the name of the image in the mifos-stack.yml from MariaDB to MySQL)

```bash
$ docker build -t com.mx.fintecheando.mysql.mifosx.17.07.01 .
```

4. Run the Docker images using Compose

```bash
$ docker-compose -f mifos-stack.yml up
```

5. Verify the running container

```bash
$ docker image ls | grep mifosx.17.07.01
CONTAINER ID        IMAGE                                         COMMAND                  CREATED             STATUS              PORTS                                            NAMES
9d8b888b45a3        com.mx.fintecheando.mariadb.mifosx.17.07.01   "docker-entrypoint.s…"   7 minutes ago       Up 7 minutes        3306/tcp                                         fintecheandomifosdockerubuntu_mariadb_1
4f09f510dbdb        com.mx.fintecheando.mifosx.17.07.01           "/bin/sh -c /entrypo…"   7 minutes ago       Up 8 minutes        0.0.0.0:8080->8080/tcp, 0.0.0.0:8443->8443/tcp   fintecheandomifosdockerubuntu_mifosx_1
```

6. Login to Mifos using the Web UI with these credentials:

username: mifos
password: password

https://localhost:8443/community-app/#/ (secure web access, but this is a self signed certificate and you will have a warning in your web explorer, just ignore it and continue)


7. As note if you have any issue with the volumes and entry points remove the volumes (be careful, with this we are removing all of them, because it is running in our local DEV, don't do this in Production)

$ docker stop $(docker ps -a -q)
$ docker rm $(docker ps -a -q)
$ docker volume rm $(docker volume ls -q)

Reference 

* http://mifos.org/take-action/get-mifos/#download
* https://mifosforge.jira.com/wiki/spaces/docs/pages/74711072/Mifos+X+Installation+on+Linux+-+Ubuntu+Server 
* https://github.com/dmitryint/docker-mifosx
* https://github.com/docker-library/docs/tree/master/mariadb
* https://docs.docker.com/docker-cloud/builds/push-images/
