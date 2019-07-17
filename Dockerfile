#!/bin/bash

#  Script Simples para a instalação do NodeOS
# Projeto para implantação de Infraestruturas
# --------------------------------
# autor    : Humberto Machado (Hmaxsuel25) 
#          
# projeto   : https://github.com/hmaxsuel25/infra-NodeOS
#
# licença  : MIT (https://mit-license.org/)
#
# links de referencia: https://terraform.io
#                      https://node-os.com

FROM debian
LABEL name="hmaxsuel25"

RUN apt-get update \ 
    && apt-get dist-upgrade -y \
    && apt-get install apt-transport-https ca-certificates -y

RUN  sh -c "echo deb https://apt.dockerproject.org/repo debian-jessie main > /etc/apt/sources.list.d/docker.list" \ 
&& apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
 
# Instalando Pacotes Substanciais
RUN apt-get update \
    && apt-get install -y wget \
    python-pip \
    jq \
    git \
    unzip \
    build-essential \ 
    vim \
    docker-engine \
    docker-compose \
    && pip install --upgrade awscli s3cmd


# Instalando Terraform
ENV TERRAFORM_VERSION 0.11.7
RUN mkdir -p /opt/terraform
RUN wget -nc -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -P /opt/terraform
RUN unzip -q /opt/terraform/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /opt/terraform
ENV PATH $PATH:/opt/terraform


RUN mkdir -p /usr/src/app
VOLUME /usr/src/app


WORKDIR /usr/src/app
