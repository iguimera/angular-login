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
  description = "Name of the Heroku app"
}

variable "sourc" {
  description = "Name of the app"
}

resource "heroku_app" "example" {
  name   = var.branch
  region = "us"
}

resource "heroku_build" "example" {
  app = heroku_app.example.name

  source {
    url     = var.sourc
    version = "1.0.0"
  }
}

