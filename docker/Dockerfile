FROM jenkins/jenkins:2.479.2 -jdk17

LABEL maintainer="gandradecortez50@gmail.com" \
      version="1.0" \
      description="Imagem do jenkins personalizada por Gabriel Andrade" \
      signedBy="Gabriel Andrde Cunha"

USER root

ENV JENKINS_HOME=/home/jenkins

VOLUME ["/home/jenkins"]

# instalando ssh para facilitar configurações de acesso 
# aos Jenkinsfiles em repositorios privados do github
RUN apt-get update && apt-get install -y openssh-client && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

WORKDIR /home/jenkins

RUN chown -R jenkins:jenkins /home/jenkins && \
    chmod -R 700 /home/jenkins

# usuario jenkins para segurança do container
USER jenkins
