# PostgreSQL
{id: docker-postgresql}

## Run PostgreSQL in Docker
{id: run-postgresql-in-docker}

```
docker run --name pg1 -e POSTGRES_PASSWORD=secret -d postgres
```

```
docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED              STATUS              PORTS               NAMES
8bfa343f4f3e        postgres            "docker-entrypoint.s…"   About a minute ago   Up About a minute   5432/tcp            pg1
```
