resource "aws_instance" "jenkins" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public[0].id
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.alb_sg.id]
  associate_public_ip_address = true

  user_data = file("${path.module}/userdata.sh")

  tags = {
    Name = "Jenkins-Server"
  }
}