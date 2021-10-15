locals {
    sg_name = "sg-test-terraform-${terraform.workspace}"
}

resource "aws_security_group" "sg-test-terraform" {
  name        = local.sg_name
  description = local.sg_name
  vpc_id      = local.env_vars.vpc_id



  egress {
    #description = ""
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    env = "${terraform.workspace}"
    project = local.env_vars.project_name
  }
}
