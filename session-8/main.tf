resource "aws_instance" "first_ec2" {
    ami = data.aws_ami.amazon_linux_2.image_id
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.main.id]
    key_name = aws_key_pair.terraform_server.key_name

    provisioner "file" {
        source = "/home/ec2-user/terraform-session-january/session-8/index.html" #path on Terraform Server
        destination = "/tmp/index.html"  # path for the remote server

        connection {
            type = "ssh"
            user = "ec2-user"  # Remote Server User
            host = self.public_ip
            private_key = file("~/.ssh/id_rsa")
        }
    }
    provisioner "remote-exec" {
        inline = [
            "sudo yum install httpd -y",
            "sudo systemctl enable httpd",
            "sudo systemctl start httpd",
            "sudo cp /tmp/index.html /var/www/html/index.html"
        ]
      
    }
}
resource "aws_key_pair" "terraform_server" {
    key_name = "Terraform-Server_Key"
    public_key = file("~/.ssh/id_rsa.pub")  
}
output "install_ip" {
    value = aws_instance.main.public_ip
  
}
