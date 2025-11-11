output "repository_url" {
  value = "${aws_ecr_repository.rails_terraform_app.repository_url}"
}

output "cluster_name" {
  value = "${aws_ecs_cluster.cluster.name}"
}

output "service_name" {
  value = "${aws_ecs_service.web.name}"
}

output "security_group_id" {
  value = "${aws_security_group.ecs_service.id}"
}
