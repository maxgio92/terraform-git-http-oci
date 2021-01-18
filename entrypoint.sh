#!/bin/sh

set -e

#git config --global credential.helper '!f() { sleep 1; echo "username=${GIT_USER}"; echo "password=${GIT_PASS}"; }; f'
git config --global credential.username ${GIT_USER}

#terraform $@
exec $@
