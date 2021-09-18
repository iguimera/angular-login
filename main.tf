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

variable "source" {
  description = "Name of the source release"
}

resource "heroku_app" "example" {
  name   = var.branch
  region = "us"
}

resource "heroku_build" "example" {
  app        = heroku_app.example.name
  source {
    url     = var.source
    version = "1.0.0"
  }
}
