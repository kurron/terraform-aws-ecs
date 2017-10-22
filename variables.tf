variable "region" {
    type = "string"
    description = "The AWS region to deploy into (e.g. us-east-1)"
}

variable "name" {
    type = "string"
    description = "What to name the resources being created"
}

variable "project" {
    type = "string"
    description = "Name of the project these resources are being created for"
}

variable "purpose" {
    type = "string"
    description = "The role the resources will play"
}

variable "creator" {
    type = "string"
    description = "Person creating these resources"
}

variable "environment" {
    type = "string"
    description = "Context these resources will be used in, e.g. production"
}

variable "freetext" {
    type = "string"
    description = "Information that does not fit in the other tags"
}

variable "duty" {
    type = "string"
    description = "Special tag value used to locate specific running instances, e.g. Docker or Bastion"
}

variable "ami_regexp" {
    type = "string"
    description = "Regular expression to use when looking up an AMI in the specified region"
}

variable "ebs_optimized" {
    type = "string"
    description = "Boolean indicating if the instance should enable EBS optimization or not"
}

variable "instance_type" {
    type = "string"
    description = "They instance type to build the instances from"
}

variable "ssh_key_name" {
    type = "string"
    description = "Name of the SSH key to install onto the instances"
}

variable "security_group_ids" {
    type = "list"
    description = "List of security groups to apply to the instances"
}

variable "subnet_ids" {
    type = "list"
    description = "List of subnets to create the instances in"
}

variable "instance_profile" {
    type = "string"
    description = "ID of the IAM profile to associate with the instances"
}

variable "scheduled" {
    type = "string"
    description = "If set to Yes, the instances will be parked on a schedule"
}

variable "instance_limit" {
    type = "string"
    description = "A number indicating how many instances to create. A value of 0 creates one instance per subnet."
    default = "0"
}

variable "spot_price" {
    type = "string"
    description = "The maximum hourly price (bid) you are willing to pay for the instance, e.g. 0.10"
}

variable "launch_group" {
    type = "string"
    description = "Group name to assign the instances to so they can be started/stopped in unison, e.g. purple-plutonium"
    default = "defaulted"
}

variable "instance_interruption_behaviour" {
    type = "string"
    description = "whether a Spot instance stops or terminates when it is interrupted, can be stop or terminate"
}
