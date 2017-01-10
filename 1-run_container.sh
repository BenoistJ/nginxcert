#!/bin/sh
docker rm -f $(docker ps -a -q) > /dev/null
docker run -ti -p 80:80 -p 443:443 -v $(pwd):/root/nginxfiles --name webserver ubuntu_sp bash
