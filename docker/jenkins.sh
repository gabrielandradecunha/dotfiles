#!/bin/bash

#################################################################################################################################
#                                                                                                                               #
#  Esse container segue as boas praticas de segurança e ao mesmo tempo contem algumas configurações para facilitar meu dia dia  #
#                                                                                                                               #
#################################################################################################################################


# Logica para modificar os atributos do container

# echo "Insira o caminho para o Dockerfile do Jenkins (padrão . ): "; read DOCKERFILE_PATH
# echo "Insira o nome da imagem: "; read NOME_IMG
# echo "Insira o nome do container: "; read NOME_CONTAINER

############ atributos automaticamente definidos (padrão) ##################

DOCKERFILE_PATH="."
NOME_IMG="jenkins_gabriel"
NOME_CONTAINER="jenkins_gabriel"

############################# validações #################################

if [[ ! -f "$DOCKERFILE_PATH/Dockerfile" ]]; then
    echo "O Dockerfile não existe"
    exit 1
fi

if docker images --format "{{.Repository}}" | grep -q "$NOME_IMG"; then
    IMG_ANTIGA=$(docker images --format "{{.Repository}}" | grep "$NOME_IMG")
    docker rmi -f "$IMG_ANTIGA"
fi

docker build -t "$NOME_IMG" -f "$DOCKERFILE_PATH/Dockerfile" .

if docker ps -a --format "{{.Names}}" | grep -q "$NOME_CONTAINER"; then
    docker stop "$NOME_CONTAINER"
    docker rm "$NOME_CONTAINER"
fi

########################## criando container #################################

docker run -d -p 8888:8080 -p 50000:50000 \
        --name "$NOME_CONTAINER" \
        -v jenkins_volume:/home/jenkins \
        --restart always "$NOME_IMG"

######################### criando a chave SSH ################################

# passo 1: criação do diretório e ajustes de permissões
docker exec -u root "$NOME_CONTAINER" bash -c \
"mkdir -p /home/jenkins/.ssh && \
 chown -R jenkins:jenkins /home/jenkins/.ssh && \
 chmod 700 /home/jenkins/.ssh"

# passo 2: gerar a chave SSH com o usuário jenkins
docker exec -u jenkins -it "$NOME_CONTAINER" bash -c \
"ssh-keygen -t rsa -b 2048 -f /home/jenkins/.ssh/id_rsa -N ''"

# passo 3: ajustar permissões após a geração da chave
docker exec -u root "$NOME_CONTAINER" bash -c \
"chmod 700 /home/jenkins/.ssh && \
 chmod 600 /home/jenkins/.ssh/id_rsa && \
 chmod 644 /home/jenkins/.ssh/id_rsa.pub && \
 chown -R jenkins:jenkins /home/jenkins/.ssh"

# passo 4: salvar chave gerada
CHAVE=$(docker exec -u jenkins -it "$NOME_CONTAINER" cat /home/jenkins/.ssh/id_rsa.pub)

##############################################################################

if [ $? -eq 0 ]; then

    echo "$CHAVE" > ssh_jenkins_key
    if [ $? -eq 0 ]; then

        echo "Chave gerada e armazenada em ssh_jenkins_key"

    else

        echo "Erro ao gerar e armazenar chave"

    fi

else

    echo "Erro ao obter chave ssh!"

fi
