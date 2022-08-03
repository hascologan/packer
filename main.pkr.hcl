packer {
  required_plugins {
    amazon = {
      version = ">= 1.8.2"
      source = "github.com/hashicorp/amazon"
    }
  }
}

locals { 
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")

source "amazon-ebs" "cisImage" {
  source_ami    = "${var.source_ami}"
  ami_name      = "${var.ami_name}-${local.timestamp}"
  instance_type = "${var.instance_type}"
  region        = "${var.region}"
  source_ami_filter {
    filters = {
      name                = "${var.source_ami_name}"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["${var.owners}"]
  }
  ssh_username = "${var.ssh_username}"
}

build {
  sources = ["source.amazon.ebs.cisImage"]
  provisioner = "shell" {
    script = "./install_rpms.sh"
  }
}
