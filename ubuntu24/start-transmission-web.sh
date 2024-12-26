sudo apt-get install transmission-cli transmission-common transmission-daemon
sudo service transmission-daemon stop
sudo touch /etc/transmission-daemon/settings.json
sudo mv settings.json /etc/transmission-daemon/settings.json
sudo cat /etc/transmission-daemon/settings.json
sudo service transmission-daemon start