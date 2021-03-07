#!/bin/bash

set -xe

if [ -d /var/lib/mysql/dashboard_development ]
then
  ../run2.sh
else
  ../provision.sh
fi
