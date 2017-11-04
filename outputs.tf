output "arn" {
    value = ["${aws_ecs_cluster.main.arn}"]
    description = "The ARN of the ECS Cluster"
}

output "status" {
    value = ["${aws_ecs_cluster.main.status}"]
    description = "The status of the ECS Cluster"
}
