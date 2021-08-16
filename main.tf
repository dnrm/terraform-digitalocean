terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_app" "Application" {
  spec {
    name   = "weather-app"
    region = "nyc"

    static_site {
      name          = "weather-service"
      build_command = "yarn build"

      github {
        repo   = "dnrm/net"
        branch = "main"
        deploy_on_push = true
      }
    }
  }
}
