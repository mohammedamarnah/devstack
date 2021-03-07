#!/bin/bash

service mysql start
sleep 3

./bin/dashboard-server
