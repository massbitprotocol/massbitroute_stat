#!/bin/bash
SITE_ROOT=$(realpath $(dirname $(realpath $0))/..)
source $SITE_ROOT/.env.$(cat $SITE_ROOT/var/ENV)
source $SITE_ROOT/scripts/base.sh
_git_clone http://${GIT_READ}@git.massbitroute.dev/massbitroute/${ssl}.git /etc/letsencrypt
