#!/usr/bin/env bash
<<<<<<< HEAD
# Setup a web servers for the deployment of web_static.
apt update -y
apt install -y nginx
mkdir -p /data/web_static/releases/test/
mkdir -p /data/web_static/shared/
echo "<!DOCTYPE html>
<html>
  <head>
  </head>
  <body>
    <p>Nginx server test</p>
  </body>
</html>" | tee /data/web_static/releases/test/index.html
ln -sf /data/web_static/releases/test/ /data/web_static/current
chown -R ubuntu:ubuntu /data
sudo sed -i '39 i\ \tlocation /hbnb_static {\n\t\talias /data/web_static/current;\n\t}\n' /etc/nginx/sites-enabled/default
sudo service nginx restart
=======
# set up the NGINX config for web_static
# install nginx
sudo apt-get -y update
sudo apt-get -y install nginx
# make file structure
mkdir -p /data/web_static/releases/test/
mkdir -p /data/web_static/shared/
# add simple content
echo "simple content, to test your Nginx configuration" >> /data/web_static/releases/test/index.html
# symbolic link
ln -fs /data/web_static/releases/test/ /data/web_static/current
# give ownership to user and group
chown -R ubuntu:ubuntu /data
# Update the Nginx configuration to serve the content of
# /data/web_static/current/ to hbnb_static 
sed -i "/listen 80 default_server;/a location /hbnb_static {alias /data/web_static/current/;}" /etc/nginx/sites-available/default
sudo ufw allow "Nginx HTTP"
sudo service nginx restart
exit 0
>>>>>>> 798f722e8f4d9a40f56b0ee21ba8ff0a067cdca5
