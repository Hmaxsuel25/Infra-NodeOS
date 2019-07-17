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

#Setado por Padrão para local. Caso queira configurar para AWS, modificar o Provider.
provider "local" 
#{
    #region = "${var.region}" 
#}

resource "docker_container" "application" {
    image = "${docker_image.application.latest}"
    must_run = true
    name = "application"
        ports {
            internal = 8080
            external = 8080
        }
}
resource "docker_image" "aplication" {
    name = "nodeos/nodeos"
}