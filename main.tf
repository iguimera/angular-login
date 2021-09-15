terraform {
  required_providers {
    heroku = {
      source = "heroku/heroku"
    }
    random = {
      source = "hashicorp/random"
    }
  }
  backend "remote" {
    organization = "easyGOband"

    workspaces {
      name = "github-actions-test"
    }
  }
}

variable "branch" {
  description = "Name of the Heroku app provisioned as an example"
  default= "easyHola"
}

resource "heroku_app" "example" {
  name   = var.branch
  region = "us"
}


