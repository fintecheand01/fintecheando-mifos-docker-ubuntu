# Fintecheando - Mifos X 17.07.01

1. Build the image

```bash
$ docker build -t com.mx.fintecheando.mifosx.17.07.01 .
```

2. List the image 

```bash
$ docker image ls | grep mifosx.17.07.01
com.mx.fintecheando.mifosx.17.07.01                      latest                 8a90b0d8aa11        9 minutes ago       753MB
```

3. Run the image

```bash
$ docker run -p 8080:8080 com.mx.fintecheando.mifosx.17.07.01
```

4. Verify the running container

```bash
$ docker container ls
```

5. Login to Mifos using the Web UI with these credentials:

username: mifos
password: password

https://localhost:8080

https://localhost:8443


Reference 

* https://mifosforge.jira.com/wiki/spaces/docs/pages/74711072/Mifos+X+Installation+on+Linux+-+Ubuntu+Server 
* https://github.com/dmitryint/docker-mifosx

