terraform {
  required_providers {
    heroku = {
      source = "heroku/heroku"
    }
  }
}


resource "heroku_app" "example" {
  name   = "easygoband-teste2222"
  region = "us"
}


resource "heroku_build" "example" {
  app = heroku_app.example.name

  source {
    url     = "https://github.com/iguimera/angular-login/archive/refs/tags/test.tar.gz"
    version = "1.0.0"
  }
}
