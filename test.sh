#!/bin/bash

cd online
python -m SimpleHTTPServer 9901 &
cd ../offline
python -m SimpleHTTPServer 9902 &
cd ..
sleep 1
curl http://localhost:9901
curl http://localhost:9902
cp /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.backup
cp haproxy.cfg /etc/haproxy/haproxy.cfg
systemctl restart haproxy.service
tail -50 /var/log/messages

curl http://localhost
# should say online

# kill 9901

curl http://localhost
# should say offline

# restart 9901

curl http://localhost
# should say online

