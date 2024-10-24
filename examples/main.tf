# lookup AMI 
data "aws_ami" "this" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amazon-eks-node-1.27-v*"]
  }

  owners = "602401143452"
}

locals {
  user_data = <<EOF
#!/bin/bash
sudo hostnamectl set-hostname test.test
EOF
}

module "ec2" {
  source = "../"

  team         = "platform"
  project      = "containers"
  cluster_name = "production"
  name         = "excalibur"

}