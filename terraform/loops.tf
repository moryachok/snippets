# Following code will produce 3 aws isntances, each one in different availability zone

variable "azs" {
  description = "Run the EC2 Instances in these Availability Zones"
  type = "list"
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

resource "aws_instance" "example" {
  count = 3
  ami = "ami-2d39803a"
  instance_type = "t2.micro"
  availability_zone = "${element(var.azs, count.index)}"
  tags {
    Name = "example-${count.index}"
  }
}

# Following code will produce 15 aws isntances, each 5 in different availability zones
# once count > var.azs, element() will use Math.mod function
variable "azs" {
  description = "Run the EC2 Instances in these Availability Zones"
  type = "list"
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

resource "aws_instance" "example" {
  count = 15 
  ami = "ami-2d39803a"
  instance_type = "t2.micro"
  availability_zone = "${element(var.azs, count.index)}"
  tags {
    Name = "example-${count.index}"
  }
}