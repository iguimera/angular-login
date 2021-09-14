# Terraform HCL
terraform {
  required_providers {
    heroku = {
      source  = "heroku/heroku"
      version = "~> 4.0"
    }
  }
  
  backend "remote" {
    organization = "easyGOband"

    workspaces {
      name = "github-actions-test"
    }
  }
}

provider "heroku" {
	email = "ivanguimera93@gmail.com"
	api_key = "cef639ff-1092-4ec6-bee0-af562198391d"
}

resource "heroku_app" "example" {
  name   = "easy-go-bute"
  region = "us"
}


output "example_app_url" {
  value = "https://${heroku_app.example.name}.herokuapp.com"
}
