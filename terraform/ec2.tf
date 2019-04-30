resource "aws_instance" "AdminNode" {
  ami                  = "ami-0e76b49ef537405f1"
  iam_instance_profile = "CompilerExplorerAdminNode"
  ebs_optimized        = false
  instance_type        = "t2.nano"
  monitoring           = false
  key_name             = "mattgodbolt"
  subnet_id            = "${aws_subnet.ce-1a.id}"

  vpc_security_group_ids = [
    "${aws_security_group.AdminNode.id}",
  ]

  associate_public_ip_address = true
  source_dest_check           = true

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 24
    delete_on_termination = true
  }

  tags {
    "Site" = "CompilerExplorer"
    "Name" = "AdminNode"
  }
}
