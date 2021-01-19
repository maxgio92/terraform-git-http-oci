#!/bin/sh

set -eu

if [ ! -z "${GIT_TOKEN}" -a ! -z "${GIT_AUTH_URL}" ]; then
	git config --global http.${GIT_AUTH_URL}.extraheader "AUTHORIZATION: bearer ${GIT_TOKEN}"
elif [ ! -z "${GIT_USER}" -a ! -z "${GIT_PASS}" -a ! -z "${GIT_AUTH_URL}" ]; then
	git config --global credential.${GIT_AUTH_URL}.helper '!f() { sleep 1; echo "username=${GIT_USER}"; echo "password=${GIT_PASS}"; }; f'
fi

exec $@
