resource "aws_instance" "simple_ec2" {
  ami                         = "${var.AMI_ID}" #"${lookup(var.AMIS, var.AWS_REGION)}" #
  instance_type               = "${var.instance_type}"
  associate_public_ip_address = true
  subnet_id                   = "${aws_subnet.public_subnet.id}"
  vpc_security_group_ids      = ["${aws_security_group.front_sg.id}"]
  key_name                    = "${aws_key_pair.mykey.key_name}"

  provisioner "local-exec" {
    command = <<EOT
      echo '[aws]\n${aws_instance.simple_ec2.public_ip}' > ansible/hosts
      echo 'my_sever_name: ${aws_instance.simple_ec2.public_ip}' > ansible/ec2_variables.yml
      sleep 20
      export ANSIBLE_HOST_KEY_CHECKING=False
      ansible-playbook -i ansible/hosts --private-key ${var.PATH_TO_PRIVATE_KEY} ansible/nginx.yml
    EOT
  }

  tags {
    Name = "Cristopherus EC2"
  }
}
