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

# Verifica se o PHP está instalado
if command -v php >/dev/null 2>&1; then
    echo "O PHP já está instalado!"
else
    echo "Instalando o PHP..."
    PACKAGE_MANAGER=""
    INSTALL_CMD=""
    CONFIGS=""

    function install(){
        eval "$CONFIGS"
        eval "$INSTALL_CMD"
    }

    if command -v apt >/dev/null; then
        PACKAGE_MANAGER="apt"
        INSTALL_CMD="sudo apt-get install -y php php-cli php-fpm php-mysql php-xml php-curl"
        DISTRO_CODENAME=$(lsb_release -c | awk '{print $2}')
        CONFIGS="sudo apt-get update"
    elif command -v dnf >/dev/null; then
        PACKAGE_MANAGER="dnf"
        INSTALL_CMD="sudo dnf install -y php php-cli php-fpm php-mysqlnd php-xml php-curl"
        CONFIGS=""
    elif command -v yum >/dev/null; then
        PACKAGE_MANAGER="yum"
        INSTALL_CMD="sudo yum install -y php php-cli php-fpm php-mysqlnd php-xml php-curl"
        CONFIGS=""
    elif command -v pacman >/dev/null; then
        PACKAGE_MANAGER="pacman"
        INSTALL_CMD="sudo pacman -S --noconfirm php php-cli php-fpm php-mysql php-xml php-curl"
        CONFIGS="sudo pacman -Sy"
    elif command -v zypper >/dev/null; then
        PACKAGE_MANAGER="zypper"
        INSTALL_CMD="sudo zypper install -y php php-cli php-fpm php-mysql php-xml php-curl"
        CONFIGS="sudo zypper refresh"
    else
        echo "Gerenciador de pacotes não suportado!"
        exit 1
    fi

    echo "Instalando o PHP com o gerenciador de pacotes $PACKAGE_MANAGER"
    install
fi

if command -v composer >/dev/null 2>&1; then
    echo "O Composer já está instalado!"
else
    echo "Instalando o Composer..."

    curl -sS https://getcomposer.org/installer | php
    mv composer.phar /usr/local/bin/composer
    echo "Composer instalado com sucesso!"
fi

if command -v phpstan >/dev/null 2>&1; then
    echo "O PHPStan já está instalado!"
else
    echo "Instalando o PHPStan..."

    composer global require phpstan/phpstan
    echo "PHPStan instalado com sucesso!"
fi

if command -v phpcs >/dev/null 2>&1; then
    echo "O PHP_CodeSniffer já está instalado!"
else
    echo "Instalando o PHP_CodeSniffer..."

    composer global require squizlabs/php_codesniffer
    echo "PHP_CodeSniffer instalado com sucesso!"
fi

if command -v php-cs-fixer >/dev/null 2>&1; then
    echo "O PHP CS Fixer já está instalado!"
else
    echo "Instalando o PHP CS Fixer..."

    composer global require friendsofphp/php-cs-fixer
    echo "PHP CS Fixer instalado com sucesso!"
fi

echo "Instalação completa!"

