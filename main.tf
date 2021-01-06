provider "aws" {
    region = var.AWS_REGION
    profile = "list"
}

resource "aws_instance" "ec2_instance" {
    ami = var.AMI
    key_name = "aws"
    instance_type = "t2.micro"
    tags = {Name = "Jen-Ter-Ans-server"}



provisioner "remote-exec" {

inline = [
"sudo sed -i s/PasswordAuthentication no/PasswordAuthentication yes/  /etc/ssh/sshd_config",
"sudo sed -i s/PubkeyAuthentication no/PubkeyAuthentication yes/ /etc/ssh/sshd_config",
"sudo sed -i s/PermitRootLogin no/PermitRootLogin yes/ /etc/ssh/sshd_config",
"sudo service sshd restart"

]

connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("./aws.pem")
    host     = aws_instance.ec2_instance.public_ip
  }
}

}
