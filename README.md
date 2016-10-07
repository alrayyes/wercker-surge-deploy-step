# Wercker Surge Deploy Step 

[![wercker status](https://app.wercker.com/status/53608930d55146d82ac67f64a6b82e74/m "wercker status")](https://app.wercker.com/project/bykey/53608930d55146d82ac67f64a6b82e74)

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

# Contributing

Report any bugs using the [issue tracker][issue_tracker]. Submit your own bug fixes or feature additions via a [pull request][pull_request].

# License

This theme is released under the MIT License. For more information read the [license][license].

[issue_tracker]: https://github.com/alrayyes/wercker-surge-deploy-step/issues
[pull_request]: https://github.com/alrayyes/wercker-surge-deploy-step/pulls
[license]: https://github.com/alrayyes/wercker-surge-deploy-step/blob/master/LICENSE.md
