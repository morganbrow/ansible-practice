#Attach the instance profile to the public instance
resource "aws_instance" "my_public_server" {
  count                  = var.number_of_instances
  ami                    = data.aws_ami.web_servers.id
  instance_type          = var.ec2_type
  subnet_id              = data.aws_subnet.pubic.id
  vpc_security_group_ids = [aws_security_group.my_public_server_sg.id]
  key_name               = var.my_keypair


  tags = {
    Name = "ansible_web_server_${count.index + 1}"
  }
}
