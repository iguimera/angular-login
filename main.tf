# Terraform HCL
terraform {
  required_providers {
    heroku = {
      source  = "heroku/heroku"
      version = "~> 4.0"
    }
  }
}

provider "heroku" {
	email = "ivanguimera93@gmail.com"
	api_key = "cef639ff-1092-4ec6-bee0-af562198391d"
}

resource "heroku_app" "example" {
  name   = "easy-go-bee"
  region = "us"
}

# Build code & release to the app
resource "heroku_build" "example" {
  app        = heroku_app.example.name

  source {
    url     = "https://github.com/iguimera/angular-test/archive/refs/tags/v1.0.0.tar.gz"
    version = "1.0.0"
  }
}

output "example_app_url" {
  value = "https://${heroku_app.example.name}.herokuapp.com"
}
