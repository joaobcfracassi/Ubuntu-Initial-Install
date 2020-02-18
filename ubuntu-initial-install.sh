#!/bin/bash

echo -e "\033[01;32m| | | | |__  _   _ _ __ | |_ _   _  |_ _|_ __ (_) |_(_) __ _| |\033[00;37m"
echo -e "\033[01;32m| | | | '_ \| | | | '_ \| __| | | |  | || '_ \| | __| |/ _' | |\033[00;37m"
echo -e "\033[01;32m| |_| | |_) | |_| | | | | |_| |_| |  | || | | | | |_| | (_| | |\033[00;37m"
echo -e "\033[01;32m \___/|_.__/ \__,_|_| |_|\__|\__,_| |___|_| |_|_|\__|_|\__,_|_|\033[00;37m"
                                                               
echo -e "\033[01;32m ___           _        _ _ \033[00;37m"
echo -e "\033[01;32m|_ _|_ __  ___| |_ __ _| | |\033[00;37m"
echo -e "\033[01;32m | || '_ \/ __| __/ _' | | |\033[00;37m"
echo -e "\033[01;32m | || | | \__ \ || (_| | | |\033[00;37m"
echo -e "\033[01;32m|___|_| |_|___/\__\__,_|_|_|\033[00;37m"

echo ""
echo -e "\033[01;32mDesenvolvido por João Fracassi.\033[00;37m"
echo -e "\033[01;32mFerrmanta para otimizações do ubuntu Linux.\033[00;37m"
echo -e "\033[01;32mVersão: 1.0\033[00;37m"
echo ""
echo ""


if [ "$(id -u)" != "0" ]; then
	echo ""
	echo -e "\033[01;32mVoce deve executar este script como root!\033[00;37m"
else
	echo -e "\033[01;32mAtualizando o sistema...\033[00;37m"
	sleep 5
	apt update && apt upgrade -y && apt dist-upgrade -y
	clear
	
	echo -e "\033[01;32mVerificando se a interface é Gnome...\033[00;37m"
	if [ pgrep "gnome" > /dev/null ]; 
	then 
		echo -e "\033[01;32mExecutando otmizações no Gnome...\033[00;37m"
		sleep 2
		gsettings set org.gnome.shell.extensions.dash-to-dock show-trash true
		gsettings set org.gnome.shell.extensions.desktop-icons show-trash false
		gsettings set org.gnome.shell.extensions.desktop-icons show-home false
		gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
		apt install gnome-tweak-tool numix-icon-theme-circle -y
		clear
	else
		echo -e "\033[01;32mA interface não é Gnome....\033[00;37m"
		echo -e "\033[01;32mContinuando a instalação...\033[00;37m"
		sleep 2
		clear
	fi

	echo -e "\033[01;32mInstalando browsers...\033[00;37m"
	sleep 2
	sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
	wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - | apt update && apt-get install google-chrome-stable -y > /dev/null
	apt install Lynx -y
	clear

	echo -e "\033[01;32mMultimídia...\033[00;37m"
	sleep 2
	apt install ubuntu-restricted-extras flashplugin-installer vlc -y | apt install libdvd-pkg -y && dpkg-reconfigure libdvd-pkg
	clear

	echo -e "\033[01;32mPacote Java...\033[00;37m"
	sleep 2
	add-apt-repository ppa:linuxuprising/java && apt update && apt install oracle-java13-installer -y
	clear

	echo -e "\033[01;32mFerramentas de desenvolvimento...\033[00;37m"
	sleep 2
	snap install pycharm-community --classic	
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - | apt-get install apt-transport-https
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	apt-get update && apt-get install sublime-text git curl geany codelite python-y
	clear

	echo -e "\033[01;32mContainers...\033[00;37m"
	sleep 2
	apt update && apt install apt-transport-https ca-certificates curl software-properties-common -y
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 
	add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" | apt update
	apt-cache policy docker-ce | sleep 5 | sudo apt install docker-ce -y
	clear

	echo -e "\033[01;32mUtilitários...\033[00;37m"
	sleep 2
	apt install net-tools locate Keepassx figlet htop -y
	clear

	echo -e "\033[01;32mLimpando pacotes...\033[00;37m"
	sleep 2
	apt autoremove -y && apt autoclean -y && apt clean -y
	clear

	echo -e "\033[01;32mFinalizado a instalação dos aplicativos/ferramentas no Ubuntu Linux...\033[00;37m"
	echo ""
	echo ""

fi







