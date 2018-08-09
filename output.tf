output "connect" {
  value = "ssh -i ${aws_instance.simple_ec2.key_name} ec2-user@${aws_instance.simple_ec2.public_dns}"
}

output "public ip" {
  value = "${aws_instance.simple_ec2.public_ip}"
}

output "public dns" {
  value = "${aws_instance.simple_ec2.public_dns}"
}
