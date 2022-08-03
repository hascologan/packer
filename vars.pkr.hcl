variable "source_ami" {
  type = string
  default = "ami-0756e90c9d9868d7a"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "ami_name" {
  type = string
  default = "Official-CIS-RHEL-8-FIN-Image"
}

variable "region" {
  type = string
  default = "us-gov-west-1"
}

variable "owners" {
  type = string
  default = "345084742485"
}

variable "source_ami_name" {
  type = string
  default = "CIS Red Hat Enterprise Linux 8 Benchmark v2.0.0.1 - Level 2-*"
}

variable "ssh_username" {
  type = string
  default = "ec2-user"
}