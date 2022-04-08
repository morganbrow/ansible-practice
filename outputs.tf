output "web_servers_ips" {
  value = aws_instance.my_public_server.*.public_ip
}