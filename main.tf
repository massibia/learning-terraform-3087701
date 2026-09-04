data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    # Sostituiamo il vecchio Tomcat Bitnami con Ubuntu 24.04 ufficiale
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"] 
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  # Sostituiamo l'ID di Bitnami con l'ID ufficiale di Canonical (i creatori di Ubuntu)
  owners = ["099720109477"] 
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
/*
data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    # Sostituito con un pattern che intercetta i nuovi standard Bitnami
    #values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
    values = ["bitnami-tomcat-*"] 
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t3.nano"

  tags = {
    Name = "HelloWorld"
  }
}
*/
