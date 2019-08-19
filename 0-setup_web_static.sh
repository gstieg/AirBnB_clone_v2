#!/usr/bin/env bash
# sets up your web servers for the deployment of web_static
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install nginx
mkdir -p /data/web_static/shared/
sudo mkdir -p /data/web_static/releases/test/
printf "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" > /data/web_static/releases/test/index.html
ln -sf /data/web_static/releases/test/ /data/web_static/current
chown -R ubuntu:ubuntu /data
sed -i '/server/a location /hbnb_static {alias /data/web_static/current/;}' \
    /etc/nginx/sites/available/default
service nginx restart
