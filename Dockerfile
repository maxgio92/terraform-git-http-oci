ARG TERRAFORM_VERSION=0.13.6
FROM hashicorp/terraform:$TERRAFORM_VERSION

ENV GIT_USER myuser
ENV GIT_PASS mypassword
ENV GIT_ASKPASS "/git-askpass.sh"

COPY entrypoint.sh /entrypoint.sh
COPY git-askpass.sh /git-askpass.sh

ENTRYPOINT ["/entrypoint.sh"]
