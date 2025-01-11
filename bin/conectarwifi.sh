#!/bin/bash

echo "Insira o nome da rede: "
read NOME_REDE

TIPO_SEGURANCA=$(nmcli -f SSID,SECURITY dev wifi | grep "$NOME_REDE" | awk '{print $2}' | cut -d'/' -f1)

if [[ -z "$TIPO_SEGURANCA" ]]; then
    echo "Não foi possível detectar a segurança da rede ou rede não encontrada."
    exit 1
fi

echo "Tipo de segurança encontrado: $TIPO_SEGURANCA"

echo "Insira a senha da rede: "
read -s SENHA_REDE

nmcli dev wifi connect "$NOME_REDE" password "$SENHA_REDE"
