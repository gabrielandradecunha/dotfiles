#!/bin/bash

###########################################
#                                         #
# Testado no Ubuntu, Fedora, Rhel e Arch  #
#                                         #
###########################################

# Verifica se o script foi executado com os devidos privilégios
if [ "$(id -u)" -ne 0 ]; then
    echo "O script deve ser executado com privilégios de super usuário!"
    exit 1
fi

# Verifica se o Vim está instalado
if command -v vim >/dev/null 2>&1; then
    echo "O Vim já está instalado!"
    exit 1
fi

PACKAGE_MANAGER=""
INSTALL_CMD=""
CONFIGS=""

function install(){
    eval "$CONFIGS"
    eval "$INSTALL_CMD"
}

if command -v apt >/dev/null; then
    PACKAGE_MANAGER="apt"
    INSTALL_CMD="sudo apt-get install -y vim"
    DISTRO_CODENAME=$(lsb_release -c | awk '{print $2}')
    CONFIGS="sudo apt-get update"
elif command -v dnf >/dev/null; then
    PACKAGE_MANAGER="dnf"
    INSTALL_CMD="sudo dnf install -y vim"
    CONFIGS=""
elif command -v yum >/dev/null; then
    PACKAGE_MANAGER="yum"
    INSTALL_CMD="sudo yum install -y vim"
    CONFIGS=""
elif command -v pacman >/dev/null; then
    PACKAGE_MANAGER="pacman"
    INSTALL_CMD="sudo pacman -S --noconfirm vim"
    CONFIGS="sudo pacman -Sy"
elif command -v zypper >/dev/null; then
    PACKAGE_MANAGER="zypper"
    INSTALL_CMD="sudo zypper install -y vim"
    CONFIGS="sudo zypper refresh"
else
    echo "Gerenciador de pacotes não suportado!"
    exit 1
fi

echo "Instalando o Vim com o gerenciador de pacotes $PACKAGE_MANAGER"
install

