ARG TERRAFORM_VERSION=0.14.4
FROM hashicorp/terraform:$TERRAFORM_VERSION

ENV GIT_AUTH_URL ''
ENV GIT_TOKEN ''
ENV GIT_USER ''
ENV GIT_PASS ''

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
