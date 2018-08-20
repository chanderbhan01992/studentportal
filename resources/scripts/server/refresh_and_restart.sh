#!/bin/sh
#Refresh code
echo "Started Git Pull"
#expect git-pull-helper
#Restart servers
expect restart-gunicorn $1
expect restart-nginx
expect restart-mysql

echo "Refresh and Restarts Done"