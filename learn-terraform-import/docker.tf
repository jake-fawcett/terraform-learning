# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Terraform configuration
resource "docker_image" "nginx" {
  name         = "nginx:latest"
}


resource "docker_container" "web" {
  name  = "hashicorp-learn"
  image = docker_image.nginx.image_id
  env = []
  ports {
    external = 8081
    internal = 80
    ip       = "0.0.0.0"
    protocol = "tcp"
  }
}