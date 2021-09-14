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
	
}

resource "heroku_app" "example" {
  name   = "easy-go-bee"
  region = "us"
}


output "example_app_url" {
  value = "https://${heroku_app.example.name}.herokuapp.com"
}
