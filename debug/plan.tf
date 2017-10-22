terraform {
    required_version = ">= 0.10.6"
    backend "s3" {}
}

data "terraform_remote_state" "vpc" {
    backend = "s3"
    config {
        bucket = "transparent-test-terraform-state"
        key    = "us-west-2/debug/networking/vpc/terraform.tfstate"
        region = "us-east-1"
    }
}

data "terraform_remote_state" "security-groups" {
    backend = "s3"
    config {
        bucket = "transparent-test-terraform-state"
        key    = "us-west-2/debug/networking/security-groups/terraform.tfstate"
        region = "us-east-1"
    }
}

data "terraform_remote_state" "bastion" {
    backend = "s3"
    config {
        bucket = "transparent-test-terraform-state"
        key    = "us-west-2/debug/compute/bastion/terraform.tfstate"
        region = "us-east-1"
    }
}

data "terraform_remote_state" "iam" {
    backend = "s3"
    config {
        bucket = "transparent-test-terraform-state"
        key    = "us-west-2/debug/security/iam/terraform.tfstate"
        region = "us-east-1"
    }
}

module "ec2_spot" {
    source = "../"

    region                          = "us-west-2"
    name                            = "Ultron"
    project                         = "Debug"
    purpose                         = "Runs Docker containers"
    creator                         = "kurron@jvmguy.com"
    environment                     = "development"
    freetext                        = "No notes at this time."
    duty                            = "Docker"
    ami_regexp                      = "^amzn-ami-.*-amazon-ecs-optimized$"
    ebs_optimized                   = "false"
    instance_type                   = "m3.medium"
    spot_price                      = "0.0670"
    instance_interruption_behaviour = "stop"
    ssh_key_name                    = "${data.terraform_remote_state.bastion.ssh_key_name}"
    security_group_ids              = ["${data.terraform_remote_state.security-groups.ec2_id}"]
    subnet_ids                      = "${data.terraform_remote_state.vpc.public_subnet_ids}"
    instance_profile                = "${data.terraform_remote_state.iam.docker_profile_id}"
    scheduled                       = "Yes"
    instance_limit                  = "1"
}

output "instance_ids" {
    value = "${module.ec2_spot.instance_ids}"
}
