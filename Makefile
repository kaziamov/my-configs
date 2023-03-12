# FNAME = "Your Full Name"
# EMAIL = "your_email@whatever.com"
FNAME = "Ilia Kaziamov"
EMAIL = "kaziamov@outlook.com"


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

install-poetry:
	python3 -V
	sudo curl -sSL https://install.python-poetry.org | python3 - --git https://github.com/python-poetry/poetry.git@master && \
	export PATH="/home/ilia/.local/bin:$PATH" && \
	poetry --version

install-flatpak:
	sudo apt install flatpak && \
	sudo apt install gnome-software-plugin-flatpak && \
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

install-obs:
	flatpak install flathub com.obsproject.Studio

obs:
	flatpak run com.obsproject.Studio

install-brew:
	sudo apt-get install build-essential procps curl file git && \
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
	eval "$$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" && \
	brew doctor && \
	(echo; echo 'eval "$$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/ilia/.profile && \
	eval "$$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" && \
	sudo apt-get install build-essential && \
	brew install gcc

install-neovim:
	snap install nvim --classic

install-railway:
	brew install railway && \
	railway login --browserless


install-powersaver:
	sudo add-apt-repository ppa:slimbook/slimbook && \
	sudo apt update && \
	sudo apt install slimbookbattery && \
	sudo apt purge slimbookbattery && \
	sudo apt purge tlp tlp-drw

install-pyenv:
	brew update && \
	sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev && \
	sudo apt install libedit-dev && \
	sudo apt-get install make && \
	brew install pyenv

battery-control:
	sudo apt -y install tlp tlp-rdw && \
	sudo apt -y install acpi-call-dkms

install-docker:
	sudo apt install docker-compose	&& \
	sudo usermod -aG docker $$USER && \
	sudo service docker restart
