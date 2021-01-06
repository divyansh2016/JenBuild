provider "aws" {
    region = var.AWS_REGION
    profile = "list"
}

resource "aws_instance" "ec2_instance" {
    ami = var.AMI
    key_name = "aws"
    instance_type = "t2.micro"
    tags = {Name = "Jen-Ter-Ans-server"}


  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("aws.pem")
    host     = aws_instance.ec2_instance.public_ip
  }

   


  provisioner "remote-exec" {

inline = [
"sudo chmod 777 -R /tmp/"


]


}
provisioner "file" {
    source      = "sshd.sh"
    destination = "/tmp/sshd.sh"
  }
}
