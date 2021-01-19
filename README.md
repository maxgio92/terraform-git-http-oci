# terraform-git-http-oci

- ![Terraform 0.14.4](https://github.com/maxgio92/terraform-git-http-oci/workflows/Terraform%200.14.4/badge.svg)
- ![Terraform 0.13.6](https://github.com/maxgio92/terraform-git-http-oci/workflows/Terraform%200.13.6/badge.svg)

Terraform OCI image that allows to manage Terraform git modules on private repositories with [HTTP-based authentications](https://tools.ietf.org/html/rfc7235):
- [Basic](https://tools.ietf.org/html/rfc7617)
- [Bearer](https://tools.ietf.org/html/rfc6750) token as parth of OAuth authorization flows

## [Basic](https://tools.ietf.org/html/rfc7617)

### Required environment variables

- `GIT_AUTH_URL`: the URL of the Git server that will be the [context](https://git-scm.com/docs/gitcredentials#_credential_contexts) for which configure the credentials.
- `GIT_USER`: the username value.
- `GIT_PASS`: the password value.

**Note**: these environment variables are additional to the already Terraform-supported ones.

## [Bearer](https://tools.ietf.org/html/rfc6750)

### Required environment variables

- `GIT_AUTH_URL`: the URL of the Git server that will be the [context](https://git-scm.com/docs/gitcredentials#_credential_contexts) for which configure the credentials.
- `GIT_TOKEN`: the bearer token value.

**Note**: these environment variables are additional to the already Terraform-supported ones.

### Example

```shell
docker run --rm \
      -e GIT_AUTH_URL="https://github.com" \
      -e GIT_TOKEN="${GIT_TOKEN}" \
      -v $(pwd):/workspace -w /workspace \
      maxgio92/terraform-git-http:0.13.6 \
      terraform init
```

#### [`azure-pipelines.yml`](https://docs.microsoft.com/en-us/azure/devops/pipelines/yaml-schema?view=azure-devops):

```yaml
variables:
- name: gitAuthUrl
  value: https://github.com
steps:
- script: |
    docker run \
      -e GIT_AUTH_URL="${GIT_AUTH_URL}" \
      -e GIT_TOKEN="${SYSTEM_ACCESSTOKEN}" \
      --rm -v $(pwd):/workspace -w /workspace \
      maxgio92/terraform-git-http:0.13.6 \
      terraform init ./src
  env:
    SYSTEM_ACCESSTOKEN: $(System.AccessToken)
    GIT_AUTH_URL: ${{ variables.gitAuthUrl }}
```

# Build

## Different Terraform versions

### Build args:

- `TERRAFORM_VERSION`: the version tag of [`hashicorp/terraform`](https://hub.docker.com/r/hashicorp/terraform) OCI image this image will start from.

```
docker build . --build-arg TERRAFORM_VERSION=<Terraform version>
```
