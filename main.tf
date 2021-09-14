terraform {
  required_providers {
    aws = {
      source  = "hashicorp/heroku"
      version = "3.26.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
  required_version = ">= 0.14"

  backend "remote" {
    organization = "easyGOband"

    workspaces {
      name = "github-actions-test"
    }
  }
}


provider "aws" {
  region = "us"
}



resource "random_pet" "sg" {}

resource "heroku_app" "web" {
  name                    = "iep"
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
}


output "web-address" {
  value = "${heroku_app.web.name}:8080"
}
