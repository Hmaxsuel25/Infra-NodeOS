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

provider "linode" {
  token = var.token
}
locals {
  instance_type = "g6-standard-1"
}
data "linode_instance_type" "details" {
  id = local.instance_type
}
resource "linode_instance" "vm" {
  count = length(var.instances_name)
label           = var.instances_name[count.index]
  region          = var.region
  image           = "linode/debian10"
  type            = local.instance_type
  root_pass       = var.root_pass
  authorized_keys = [for key in var.authorized_keys : chomp(file(key))]
tags = var.identification_tags
}