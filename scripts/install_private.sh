#!/bin/bash
SITE_ROOT=$(realpath $(dirname $(realpath $0))/..)
auth=massbit:41d919e74993945a97972d147c4d01847e8bc1b6
service=ssl
git clone http://${auth}@git.massbitroute.com/massbitroute/${service}.git /etc/letsencrypt
git -C /etc/letsencrypt remote set-url origin http://$user:$pass@git.massbitroute.com/massbitroute/${service}.git
