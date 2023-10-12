provider"aws"{
profile="terraform_user"
access_key="AKIAVIKIQAIRTXPQG34D"
secret_key="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"
region="ap-south-1"
}

resource"aws_instance""linux"{
ami="ami-0a5ac53f63249fba0"
instance_type="t2.micro"

security_groups=["${aws_security_group.allow_ssh_http.name}"]
tags={
Name="Linux-Instance"
}
key_name="terraform-linux"

# userdata script
user_data=file("script.sh")
}

resource"aws_security_group""allow_ssh_http"{
tags={
Name="Allow_SSH_HTTP"
}
name="allow_ssh_httpd"
description="allow ssh & http traffic"

ingress{
description="allow ssh"
from_port=22 # by default, linux server listens to TCP port 22 for SSH
to_port=22
protocol="tcp"
cidr_blocks=["0.0.0.0/0"]
}

ingress{
description="allow httpd"
from_port=80 # by default, linux server listens to TCP port 80 for http
to_port=80
protocol="tcp"
cidr_blocks=["0.0.0.0/0"]
}

egress{
from_port=0
to_port=0
protocol="-1"
cidr_blocks=["0.0.0.0/0"]
}
}
