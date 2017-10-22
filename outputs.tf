output "instance_ids" {
    value = ["${aws_spot_instance_request.instance.*.id}"]
    description = "IDs of the created instances"
}
