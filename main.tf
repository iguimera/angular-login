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

resource "heroku_app" "example" {
  email = "ivanguimera93@gmail.com"
	api_key = "cef639ff-1092-4ec6-bee0-af562198391d"
  name   = "easy-go-beeed"
  region = "us"
}


