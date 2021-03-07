#!/bin/bash

set -xe

service mysql start
sleep 3

git stash
git checkout edraak/devstack-branch-2021-06-02

echo "drop database if exists dashboard_development;" | mysql
echo "drop database if exists dashboard_test;" | mysql
echo "drop database if exists pegasus_development;" | mysql

bundle install --verbose
bundle exec rake install:hooks
bundle exec rake install --trace
