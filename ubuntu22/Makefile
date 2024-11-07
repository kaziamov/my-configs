# FNAME = "Your Full Name"
# EMAIL = "your_email@whatever.com"
FNAME = "Ilia Kaziamov"
EMAIL = "kaziamov@outlook.com"

WORK_NAME = "Ilia Kaziamov"
WORK_EMAIL = "ilya.kazyamov@hotmail.com"

upgrade:
	sudo apt update && \
	sudo apt upgrade && \
	sudo apt-get dist-upgrade

fix:
	sudo apt --fix-broken install
rm:
	sudo apt autoremove

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

ssh-conf:
	nano ~/.ssh/config

connect-github:
	ssh-keygen -o -t rsa -C $(EMAIL) && \
	echo "Your SSH key is " && cat ~/.ssh/id_rsa.pub && \
	x-www-browser --new-window https://github.com/settings/keys

connect-work-github:
	ssh-keygen -o -t rsa -C $(WORK_EMAIL) -f ~/.ssh/work_rsa && \
	echo "Your SSH key is " && cat ~/.ssh/work_rsa.pub && \
	x-www-browser --new-window https://github.com/settings/keys

check-github:
	ssh -T git@github.com

install-poetry:
	python3 -V
	sudo curl -sSL https://install.python-poetry.org | python3 - && \
	export PATH="/home/ilia/.local/bin:$PATH" && \
	poetry --version

install-obs:
	sudo add-apt-repository ppa:obsproject/obs-studio && \
	sudo apt update && \
	sudo apt install ffmpeg obs-studio

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

install-pyenv:
	brew update && \
	sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev && \
	sudo apt install libedit-dev && \
	sudo apt-get install make && \
	brew install pyenv

install-docker:
	sudo apt install docker-compose	&& \
	sudo usermod -aG docker $$USER && \
	sudo service docker restart

install-python:
	CPPFLAGS="-I$(shell brew --prefix openssl)/include" \
	LDFLAGS="-L$(shell brew --prefix openssl)/lib" \
	pyenv install 3.10.11

install-psql:
	sudo apt install postgresql

# Fix command
update-docker-path:
	sudo systemctl stop docker && \
	sudo touch /etc/docker/daemon.json && \
	sudo echo '{\\n"data-root": "/mnt/drive"\\n}' >> /etc/docker/daemon.json && \
	sudo systemctl start docker

reinstall-openssl:
	sudo apt-get install openssl libssl-dev  && \
	brew install openssl@1.1

ubuntu-tweaks:
	sudo apt install gnome-tweaks
