
resource "heroku_app" "example" {
  name   = "easygoband-teste"
  region = "us"
}


resource "heroku_build" "example" {
  app = heroku_app.example.name

  source {
    url     = "https://github.com/iguimera/angular-login/archive/refs/tags/test.tar.gz"
    version = "1.0.0"
  }
}
