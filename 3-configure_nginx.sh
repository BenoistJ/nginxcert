#/bin/sh
echo "daemon off;" >> /etc/nginx/nginx.conf
sed -i "s/root/www-data/" /etc/nginx/nginx.conf
rm -f /etc/nginx/sites-available/default
ln -s $(pwd)/nginx_config /etc/nginx/sites-available/default
