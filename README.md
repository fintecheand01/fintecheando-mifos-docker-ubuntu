# fintecheando-mifos-docker-ubuntu

# fincore-docker
FinCORE - Docker

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
