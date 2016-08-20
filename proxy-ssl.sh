#!/bin/bash
# Script para iniciar los servidores proxy
echo "Reiniciando servidores proxy..."
sudo /etc/init.d/privoxy stop
sudo /etc/init.d/polipo stop
echo "Listo!"
echo "Iniciando servidores proxy en orden..."
guake -n ~/guakeprojects/mitmproxy-term -r "MITMPROXY"
guake -e "cd /private-dir/mitmproxy"
guake -e "./venv/bin/activate"
guake -e "mitmproxy -p 8080"
guake -e "exit"
sleep 5
sudo /etc/init.d/polipo start
sleep 5
sudo /etc/init.d/privoxy start
echo "Listo! (*:8118)"
exit 1
