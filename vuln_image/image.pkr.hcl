packer {
  required_plugins {
    digitalocean = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/digitalocean"
    }
  }
}

variable "api_token" {
  type = string
}

source "digitalocean" "vuln_image" {
  api_token    = var.api_token
  image        = "ubuntu-20-04-x64"
  region       = "sgp1"
  size         = "s-2vcpu-2gb"
  ssh_username = "root"
}

build {
  sources = ["source.digitalocean.vuln_image"]

  provisioner "shell" {
    inline = [
      "apt-get clean",
      "apt-get update",
      "apt-get upgrade -y",

      # Install docker and docker-compose
      "apt-get install -y apt-transport-https ca-certificates nfs-common",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
      "add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\"",
      "apt-get update",
      "apt-get install -y docker-ce",
      "curl -L \"https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)\" -o /usr/local/bin/docker-compose",
      "chmod +x /usr/local/bin/docker-compose",
      
      # Install haveged, otherwise docker-compose may hang: https://stackoverflow.com/a/68172225/1494610
      "apt-get install -y haveged",

      # Add users for services
      "useradd -m -s /bin/bash coffeepot",
      "useradd -m -s /bin/bash freelife",
      "useradd -m -s /bin/bash healthmonitor",
      "useradd -m -s /bin/bash nasarasa",
    ]
  }

  # Copy services
  provisioner "file" {
    source = "../services/coffeepot/service/"
    destination = "/home/coffeepot/"
  }

  provisioner "file" {
    source = "../services/freelife/service/"
    destination = "/home/freelife/"
  }

  provisioner "file" {
    source = "../services/nasarasa/service/"
    destination = "/home/nasarasa/"
  }

  provisioner "file" {
    source = "../services/healthmonitor/service/"
    destination = "/home/healthmonitor/"
  }

  # Build and run services for the first time
  provisioner "shell" {
    inline = [
      "cd ~coffeepot",
      "docker-compose up --build -d",
      "cd ~freelife",
      "docker-compose up --build -d",
      "cd ~nasarasa",
      "docker-compose up --build -d",
      "cd ~healthmonitor",
      "docker-compose up --build -d",


    ]
  }

}
