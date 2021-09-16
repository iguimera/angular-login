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

variable "AUTOMATIC_RELEASES_TAG" {
  type    = string
  default = "easyyy"
}

resource "heroku_app" "example" {
  name   = var.AUTOMATIC_RELEASES_TAG
  region = "us"
}


