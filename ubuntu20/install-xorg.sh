sudo apt install xorg
sudo apt install ubuntu-desktop
sudo apt-get --reinstall install xserver-xorg-input-libinput xserver-xorg-input-wacom xserver-xorg-input-evdev xserver-xorg-input-synaptics xserver-xorg-video-amdgpu xserver-xorg-core

sudo systemctl restart gdm3

sudo reboot now