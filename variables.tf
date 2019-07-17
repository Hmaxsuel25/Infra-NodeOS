#!/bin/bash

# Autoescala AWS com Terraform
# Projeto para implantação de Infraestruturas com AWS+Terraform
# --------------------------------
# autor    : Humberto Machado (Hmaxsuel25) 
#          
# projeto   : https://github.com/hmaxsuel25/autoescala-aws-infra
#
# licença  : MIT (https://mit-license.org/)
#
# link de referencia: https://terraform.io


#Arquivo de Variaveis
variable "region" {
  description = "Sao Paulo"
  default = "sa-east1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default = "t2.micro"
}