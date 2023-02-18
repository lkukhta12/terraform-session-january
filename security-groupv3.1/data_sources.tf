# Fetch AMI id form AWS using Dtaa Source Block - it goes into ASW and finds the AMI

data "aws_ami" "amazon_linux_2" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.*"]
  }
  filter {
    name = "architecture"
    values = ["x86_64"]
  }
}

#resource "aws_ami" "amazon_linux_2" {
#    name = "myami"
#}

 # filter {
 #  name   = "root-device-type"
 #values = ["ebs"]
  # }
  # filter {
  #  name   = "virtualization-type"
  #  values = ["hvm"]
  #}


#owner self - means ami belongs to you - we used amazon as ami we are going to use belongs to aws
#most_recent is the most recent version

# Owners - (Required) List of AMI owners to limit search. At least 1 value must be specified. Valid values: an AWS account ID, self (the current account), or an AWS owner alias (e.g. amazon, aws-marketplace, microsoft).
# Most_recent - (Optional) If more than one result is returned, use the most recent AMI.
# Executable_users - (Optional) Limit search to users with explicit launch permission on the image. Valid items are the numeric account ID or self.
# Filter - (Optional) One or more name/value pairs to filter off of. There are several valid keys, for a full reference, check out describe-images in the AWS CLI reference.
# Name_regex - (Optional) A regex string to apply to the AMI list returned by AWS. This allows more advanced filtering not supported from the AWS API. This filtering is done locally on what AWS returns, and could have a performance impact if the result is large. It is recommended to combine this with other options to narrow down the list AWS returns.