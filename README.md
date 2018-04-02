# Fintecheando - Mifos X 17.07.01

1. Build the MIFOS X image

```bash
$ docker build -t com.mx.fintecheando.mifosx.17.07.01 .
```

2. Build the MariaDB image

```bash
$ docker build -t com.mx.fintecheando.mariadb.mifosx.17.07.01 .
```

3. Build the MySQL image (optional)

```bash
$ docker build -t com.mx.fintecheando.mysql.mifosx.17.07.01 .
```

4. List the image 

```bash
$ docker image ls | grep mifosx.17.07.01
com.mx.fintecheando.mifosx.17.07.01                      latest                 8a90b0d8aa11        9 minutes ago       753MB
```

5. Run the Docker images using Compose

```bash
$ docker-compose -f mifos-stack.yml up
```

6. Verify the running container

```bash
$ docker container ls
```

7. Login to Mifos using the Web UI with these credentials:

username: mifos
password: password

https://localhost:8080 (insecure)

https://localhost:8443 (secure, but this is a self signed certificate and you will have a warning in your web explorer, just ignore it and continue)


Reference 

* http://mifos.org/take-action/get-mifos/#download
* https://mifosforge.jira.com/wiki/spaces/docs/pages/74711072/Mifos+X+Installation+on+Linux+-+Ubuntu+Server 
* https://github.com/dmitryint/docker-mifosx
* https://github.com/docker-library/docs/tree/master/mariadb
* https://docs.docker.com/docker-cloud/builds/push-images/
