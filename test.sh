
cd online
python -m SimpleHTTPServer 9901 &
PID_ONLINE=$!
echo Online Process ID = $PID_ONLINE

cd ../offline
python -m SimpleHTTPServer 9902 &
PID_OFFLINE=$1
echo Offline Process ID = $PID_OFFLINE

cd ..
sleep 1
curl http://localhost:9901
curl http://localhost:9902
cp /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.backup
cp haproxy.cfg /etc/haproxy/haproxy.cfg
systemctl restart haproxy.service
tail -50 /var/log/messages

echo Pulling HAProxy - Should Say Online...
curl http://localhost

# kill 9901
kill -9 $PID_ONLINE
sleep 1

echo Pulling HAProxy - Should Say Offline...
curl http://localhost

cd online
python -m SimpleHTTPServer 9901 &
PID_ONLINE=$!
echo Online Process ID = $PID_ONLINE
sleep 1

echo Pulling HAProxy - Should Say Online...
curl http://localhost
