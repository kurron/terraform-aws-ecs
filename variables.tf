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

variable "instance_type" {
    type = "string"
    description = "They instance type to build the instances from"
}

variable "instance_profile" {
    type = "string"
    description = "ID of the IAM profile to associate with the instances"
}

variable "ssh_key_name" {
    type = "string"
    description = "Name of the SSH key to install onto the instances"
}

variable "security_group_ids" {
    type = "list"
    description = "List of security groups to apply to the instances"
}

variable "ebs_optimized" {
    type = "string"
    description = "Boolean indicating if the instance should enable EBS optimization or not"
}

variable "spot_price" {
    type = "string"
    description = "How much, per hour, you are willing to pay for the instances, e.g. 0.015"
    default = "0"
}

variable "cluster_min_size" {
    type = "string"
    description = "Minimum number of instances to maintain in the cluster, e.g. 2"
}

variable "cluster_max_size" {
    type = "string"
    description = "Maximum number of instances to maintain in the cluster, e.g. 8"
}

variable "cluster_desired_size" {
    type = "string"
    description = "Desired number of instances to maintain in the cluster, e.g. 4"
}

variable "cooldown" {
    type = "string"
    description = "The amount of time, in seconds, after a scaling activity completes before another scaling activity can start, e.g. 30"
}

variable "health_check_grace_period" {
    type = "string"
    description = "Time (in seconds) after instance comes into service before checking health, e.g. 300"
}

variable "subnet_ids" {
    type = "list"
    description = "List of subnets to create the instances in, e.g. [subnet-4a33b402,subnet-ac5f72f7]"
}

variable "scale_up_cron" {
    type = "string"
    description = "Cron expression detailing when to increase cluster capacity, e.g. 0 7 * * MON-FRI"
}

variable "scale_down_cron" {
    type = "string"
    description = "Cron expression detailing when to decrease cluster capacity, e.g. 0 0 * * SUN-SAT"
}

variable "cluster_scaled_down_desired_size" {
    type = "string"
    description = "Minimum number of instances to maintain in the cluster when scaled down, e.g. 2"
}

variable "cluster_scaled_down_min_size" {
    type = "string"
    description = "Desired number of instances to maintain in the cluster when scaled down, e.g. 4"
}

variable "cluster_scaled_down_max_size" {
    type = "string"
    description = "Maximum number of instances to maintain in the cluster when scaled down, e.g. 8"
}

variable "ami_regexp" {
    type = "string"
    description = "Regular expression to use when looking up an AMI in the specified region"
}

variable "port" {
    type = "string"
    description = "The port on which targets receive traffic."
}

variable "protocol" {
    type = "string"
    description = "The protocol to use for routing traffic to the targets."
}

variable "vpc_id" {
    type = "string"
    description = "The identifier of the VPC in which to create the target group."
}

variable "enable_stickiness" {
    type = "string"
    description = "If set to Yes, the balancer will attempt to route clients to a consistent back end."
}

variable "health_check_interval" {
    type = "string"
    description = "The approximate amount of time, in seconds, between health checks of an individual target."
}

variable "health_check_path" {
    type = "string"
    description = "The destination for the health check request."
}

variable "health_check_protocol" {
    type = "string"
    description = "The protocol to use to connect with the target."
}

variable "health_check_timeout" {
    type = "string"
    description = "The amount of time, in seconds, during which no response means a failed health check."
}

variable "health_check_healthy_threshold" {
    type = "string"
    description = "The number of consecutive health checks successes required before considering an unhealthy target healthy."
}

variable "unhealthy_threshold" {
    type = "string"
    description = "The number of consecutive health check failures required before considering the target unhealthy."
}

variable "matcher" {
    type = "string"
    description = "The HTTP codes to use when checking for a successful response from a target."
}

variable "load_balancer_arn" {
    type = "string"
    description = "The ARN of the load balancer to bind the listener to."
}
