# Terraform HCL
terraform {
  backend "remote" {
    organization = "easyGOband"

    workspaces {
      name = "github-actions-test"
    }
  }
  
  required_providers {
    heroku = {
      source  = "hashicorp/heroku"
      version = "~> 4.0"
    }
  }
}

resource "heroku_app" "example" {
  name   = "hola"
  region = "us"
}

output "example_app_url" {
  value = "https://${heroku_app.example.name}.herokuapp.com"
}
