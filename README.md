# debian11-first-config
After installation Debian 11 needed install IDE, Browser, GIT, etc. 
I use this Makefile for simple and fast config new machine

```makefile
FNAME = "Your Full Name"
EMAIL = "your_email@whatever.com"


fix-repo:
	sudo add-apt-repository "deb http://deb.debian.org/debian bullseye main contrib non-free" && \
	sudo add-apt-repository "deb-src http://deb.debian.org/debian bullseye main contrib non-free" && \
	sudo add-apt-repository "deb http://deb.debian.org/debian-security/ bullseye-security main contrib non-free" && \
	sudo add-apt-repository "deb-src http://deb.debian.org/debian-security/ bullseye-security main contrib non-free" && \
	sudo add-apt-repository "deb http://deb.debian.org/debian bullseye-updates main contrib non-free" && \
	sudo add-apt-repository "deb-src http://deb.debian.org/debian bullseye-updates main contrib non-free"

u:
	sudo apt update && \
	sudo apt upgrade && \
	sudo apt-get dist-upgrade

fix:
	sudo apt --fix-broken install
rm:
	sudo apt autoremove

install-pycharm:
	sudo apt install snapd && \
	sudo snap install pycharm-professional --classic

pycharm:
	sudo snap run pycharm-professional

p: pycharm

install-vscode:
	sudo apt update && \
	sudo apt install gnupg2 software-properties-common apt-transport-https curl && \
	curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add - && \
	sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" && \
	sudo apt update && \
	sudo apt install code

install-chrome:
	sudo add-apt-repository "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" && \
	wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
	sudo apt-get update && \
	sudo apt-get install google-chrome-stable

install-git:
	sudo apt install git && \
	git --version && \
	git config --global core.autocrlf input && \
	git config --global user.name $(FNAME) && \
	git config --global user.email $(EMAIL)

git-conf:
	git config --global --edit

connect-github:
	ssh-keygen -o -t rsa -C $(EMAIL) && \
	echo "Your SSH key is " && cat ~/.ssh/id_rsa.pub && \
	x-www-browser --new-window https://github.com/settings/keys

check-github:
	ssh -T git@github.com
```
