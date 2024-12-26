sudo apt update
sudo apt install samba
sudo apt install nautilus-share

whereis samba


#[sambashare]
#    comment = Samba on Ubuntu
#    path = /home/username/sambashare
#    read only = no
#    browsable = yes

sudo service smbd restart
sudo ufw allow samba

sudo smbpasswd -a $(USER)