# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {}
variable "ssh_fingerprint" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "${var.do_token}"
}

# Create Kubernetes first master
resource "digitalocean_droplet" "Wordpress-DB" {
  image = "ubuntu-18-04-x64"
  name = "Wordpress-db"
  region = "ams3"
  size = "2gb"
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]
}

resource "digitalocean_droplet" "Wordpress-App" {
  image = "ubuntu-18-04-x64"
  name = "Wordpress-app"
  region = "ams3"
  size = "2gb"
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]
}
