#!/bin/bash

echo "| | | | |__  _   _ _ __ | |_ _   _  |_ _|_ __ (_) |_(_) __ _| |"
echo "| | | | '_ \| | | | '_ \| __| | | |  | || '_ \| | __| |/ _' | |"
echo "| |_| | |_) | |_| | | | | |_| |_| |  | || | | | | |_| | (_| | |"
echo " \___/|_.__/ \__,_|_| |_|\__|\__,_| |___|_| |_|_|\__|_|\__,_|_|"
                                                               
echo " ___           _        _ _ "
echo "|_ _|_ __  ___| |_ __ _| | |"
echo " | || '_ \/ __| __/ _' | | |"
echo " | || | | \__ \ || (_| | | |"
echo "|___|_| |_|___/\__\__,_|_|_|"

echo ""
echo "Desenvolvido por João Fracassi."
echo "Ferrmanta para otmizações do ubuntu Linux."


if [ "$(id -u)" != "0" ]; then
	echo
	echo "Voce deve executar este script como root!"
else
	echo "Atualizando o sistema..."
	sleep 5
	apt update && apt upgrade -y && apt dist-upgrade -y
	clear
	
	echo "Verificando se a interface é Gnome..."
	if [ pgrep "gnome-shell" > /dev/null ]; 
	then 
		echo "Executando otmizações no Gnome..."
		sleep 2
		gsettings set org.gnome.shell.extensions.dash-to-dock show-trash true
		gsettings set org.gnome.shell.extensions.desktop-icons show-trash false
		gsettings set org.gnome.shell.extensions.desktop-icons show-home false
		gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
		apt install gnome-tweak-tool -y
		clear
	else
		echo "A interface não é Gnome...."
		echo "Continuando a instalação..."
		sleep 2
		clear
	fi

	echo "Instalando browsers..."
	sleep 2
	sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
	wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - | apt update && apt-get install google-chrome-stable -y > /dev/null
	apt install Lynx -y
	clear

	echo "Multimídia..."
	sleep 2
	apt install ubuntu-restricted-extras flashplugin-installer vlc -y | apt install libdvd-pkg -y && dpkg-reconfigure libdvd-pkg
	clear

	echo "Pacote Java..."
	sleep 2
	add-apt-repository ppa:linuxuprising/java && apt update && apt install oracle-java13-installer -y
	clear

	Echo "Ferramentas de desenvolvimento..."
	sleep 2
	snap install pycharm-community --classic	
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - | apt-get install apt-transport-https
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	apt-get update && apt-get install sublime-text git curl geany codelite python-y
	clear

	echo "Utilitários..."
	sleep 2
	apt install net-tools locate Keepassx figlet htop -y
	clear

fi







