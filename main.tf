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

module "heroku-free-stack" {
  
  source = "git@github.com:iguimera/angular-login.git?ref=test1"

  name = "someawesomeappname"

  
}
