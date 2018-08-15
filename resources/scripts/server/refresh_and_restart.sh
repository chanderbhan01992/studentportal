#Refresh code
expect git-pull-helper

#Restart servers
expect restart-gunicorn
expect restart-nginx
expect restart-mysql