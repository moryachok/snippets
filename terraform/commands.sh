#!/usr/bin/env bash

# COMMON Commands for using terraform
# https://www.terraform.io/docs/commands/index.html


# FOR USING MODULES 

terraform get   # get all the modules configured on main.tf
terraform plan  # show predicted changes
terraform apply # apply changes

#############################################
### IMPORT ##################################
#############################################

# main.tf
resource "aws_autoscaling_group" "servers-asg" {
  name = "servers-asg-name"
}

# aws_autoscaling_group.servers-asg - must be contained in main.tf
# servers-asg - resource created via AWS console
# configuration will be imported to .tfstate
terraform import aws_autoscaling_group.servers-asg servers-asg

    
