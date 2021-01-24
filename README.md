# airflow

This repo is a template for running Airflow in Docker.

## Getting started

Two commands will get the server up and running. The default user credentials are `admin:admin`.

```
$ make init
$ make start
```

To shut down the webserver and scheduler, run:

```
$ make stop
```

To remove all traces of the setup, including the Airflow database, run:

```
$ make rm
```

If the Airflow scheduler is running and you'd like to gain shell access, run:

```
$ docker-compose exec airflow-scheduler bash
```

## Builds

There are two Dockerfiles available: a standard build and a build for Raspberry Pi.

The standard build is used by default. To switch to the Raspberry Pi build, change the target Dockerfile in `docker-compose.yaml` to `Dockerfile.pi`:

```
airflow-webserver:
  build:
    context: .
    dockerfile: Dockerfile.pi
...
airflow-scheduler:
  build:
    context: .
    dockerfile: Dockerfile.pi
```

_Why does Raspberry Pi need its own build?_

In short, the wheel files that Python uses to install packages from PyPI aren't available for Raspberry Pi's ARMv7 architecture. As a result, the Pi will have to download the source code for each package and build them from scratch. This is a slow process, taking hours on the Raspberry Pi 4.

Fortunately, [piwheels](https://piwheels.org) solves this problem by providing a set of wheels compatible for Raspberry Pi. To leverage this, `Dockerfile.pi` uses Python 3.7 and adds `piwheels.org` as a repository source for pip.
