provider "aws" {
    region = var.AWS_REGION
    profile = "list"
}

resource "aws_instance" "ec2_instance" {
    ami = var.AMI
    key_name = "aws"
    instance_type = "t2.micro"
    tags = {Name = "Jen-Ter-Ans-server"}

}

provisioner "remote-exec" {

inline = [

"sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config",
"sudo sed -i "/^[^#]*PubkeyAuthentication[[:space:]]no/c\PubkeyAuthentication yes" /etc/ssh/sshd_config",
"sudo sed -i "/^[^#]*PermitRootLogin[[:space:]]no/c\PermitRootlogin yes" /etc/ssh/sshd_config",
"sudo service sshd restart"

]

connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("/home/mani/key-pair/aws.pem")
    host     = aws_instance.web.public_ip
  }
}


