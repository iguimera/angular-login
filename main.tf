terraform {
  backend "remote" {
    organization = "easyGOband"

    workspaces {
      name = "github-actions-test"
    }
  }
}


resource "heroku_app" "web" {
  name      = "iep"
  region    = "us"
}


