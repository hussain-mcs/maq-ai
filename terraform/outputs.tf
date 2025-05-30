output "instance_public_ip" {
  description = "Public IP of the Lightsail instance"
  value       = aws_lightsail_static_ip.laravel_static_ip.ip_address
}

output "instance_name" {
  description = "Name of the Lightsail instance"
  value       = aws_lightsail_instance.laravel_server.name
}

output "ssh_command" {
  description = "SSH command to connect to the instance"
  value       = "ssh -i ${aws_lightsail_key_pair.laravel_key.name}.pem ubuntu@${aws_lightsail_static_ip.laravel_static_ip.ip_address}"
}

output "laravel_url" {
  description = "Laravel application URL"
  value       = "http://${aws_lightsail_static_ip.laravel_static_ip.ip_address}"
}

output "phpmyadmin_url" {
  description = "phpMyAdmin URL"
  value       = "http://${aws_lightsail_static_ip.laravel_static_ip.ip_address}:8080"
}

output "private_key" {
  value     = aws_lightsail_key_pair.laravel_key.private_key
  sensitive = true
}