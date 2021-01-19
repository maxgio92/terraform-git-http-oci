# Terraform Git HTTP OCI

Terraform OCI image that allows to manage Terraform git modules on private repositories with HTTP-based authentications:
- Basic HTTP
- Bearer token as parth of OAuth flows

## [Basic](https://tools.ietf.org/html/rfc2617)

### Required environment variables

- `GIT_AUTH_URL`: the URL of the Git server that will be the [context](https://git-scm.com/docs/gitcredentials#_credential_contexts) for which configure the credentials.
- `GIT_USER`: the username value.
- `GIT_PASS`: the password value.

## [Bearer](https://tools.ietf.org/html/rfc6750)

### Required environment variables

- `GIT_AUTH_URL`: the URL of the Git server that will be the [context](https://git-scm.com/docs/gitcredentials#_credential_contexts) for which configure the credentials.
- `GIT_TOKEN`: the bearer token value.
