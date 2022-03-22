#!/bin/bash
_git_clone() {
	_url=$1
	_dir=$2
	if [ -d "$_dir" ]; then rm -rf $_dir; fi
	mkdir -p $_dir
	git clone $_url $_dir
	# git -C $_dir remote set-url origin $_url
}
