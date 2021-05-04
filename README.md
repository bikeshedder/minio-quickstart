# MinIO + MinIO Console

This project can help you setting up minio + minio-console in no time
using `docker-compose` and a `Makefile`.

## Prerequisites

Install `docker` and `docker-compose` according to the documentation:

- https://docs.docker.com/engine/install/
- https://docs.docker.com/compose/install/

## Installation

1. Copy `.env.example` to `.env`

   ```bash
   copy .env.example .env
   ```

2. Edit `.env` as needed.


3. Run `make install`

    ```bash
    make install
    ```

This should leave you with a running `minio` and `minio-console`.

You should now be able to access http://localhost:9090 using the user `console` and password `console123`.

## Management

Start (without inital setup):

```bash
make start
```

Stop running server:

```bash
make stop
```

## Remove installation

```bash
make uninstall
```

**Attention:** This will stop the docker containers, remove the images and also delete
the volume. All data will be lost. You have been warned.
