# Wercker Step Surge Deploy

This step wil deploy your site to [Surge.sh](https://surge.sh/) using the [surge cli client](https://www.npmjs.com/package/surge).

# Requirements

This step requires a container with [npm](https://www.npmjs.com/) installed.

# Parameters

## login (required)

The surge.sh login. The login can be echoed by running

```shell
surge token
```

locally.

## directory (optional)

The directory to de deployed. Defaults to public.

## token (required)

The surge.sh token. The login can be echoed by running

```shell
surge token
```

locally.

## domain (required)

Domain to be used with surge.sh hosting.

# Example wercker.yml (Docker)

```yml
box: andthensome/alpine-surge-bash
deploy:
  steps:
    - alrayyes/surge-deploy:
        login: "user@example.com"
        directory: "public"
        token: "94a08da1fecbb6e8b46990538c7b50b2"
        domain: "example.com"
```