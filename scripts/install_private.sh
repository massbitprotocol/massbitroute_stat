#!/bin/bash
SITE_ROOT=$(realpath $(dirname $(realpath $0))/..)
source $SITE_ROOT/.env.$(cat $SITE_ROOT/var/ENV)
_git_clone() {
	_url=$1
	_dir=$2
	if [ -d "$_dir" ]; then rm -rf $_dir; fi
	mkdir -p $_dir
	git clone $_url $_dir
	git -C $_dir remote set-url origin $_url
}

_git_clone http://${GIT_READ}@git.massbitroute.com/massbitroute/${ssl}.git /etc/letsencrypt
