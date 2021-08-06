resource "aws_security_group" "securitygroup" {
    vpc_id = var.vpc_id
    name = "eksallow-ssh-http-https"
    
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "eksallow-ssh-http-https"
        Terraform = "true"
        Turbonomic = "true"
    }
}
