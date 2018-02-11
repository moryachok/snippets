#####################################################
###### IF STATEMENTS ################################
#####################################################

# using count to create boolean like behaiviour
# 1 = true, 0 = false

variable "create_eip" {
  default = 1
}

resource "aws_eip" "example" {
  count = "${var.create_eip}"
  instance = "${aws_instance.example.id}"
}

#### Example 2 #######################################

# using count to create boolean like behaiviour
# 1 = true, 0 = false

variable "instance_type" {
  default = "t1.micro"
}

# non "t" instance_type, will be replaced by 0, and as a result resource will not be created
# instance_type = t*, will be replaced by 1, that will cause resource creation
# accomplish it with `replace()` interpolation function
# inner func - replace(var.instance_type, "/^[^t].*/", "0") - return "string" OR 0
# outer func - replace(<INNER>, "/^t.*$/", "1") - return "string" OR 1
resource "aws_cloudwatch_metric_alarm" "low_cpu_credit_balance" {
  count = "${replace(replace(var.instance_type, "/^[^t].*/", "0"), 
             "/^t.*$/", "1")}"
  metric_name = "CPUCreditBalance"
  dimensions = {
    InstanceId = "${aws_instance.example.id}"
  }
  threshold = 10  
  unit = "Count"  
  comparison_operator = "LessThanThreshold"
}


#####################################################
###### IF/ELSE STATEMENTS ###########################
#####################################################

# in this technic we use simple math technic to get if/else behaiviour 
# aws_eip resource:  count=(1|0), will get true or false
# aws_route53_record : count = "${1 - var.create_eip}", 
#     1 - 1 = 0 (false)
#     1 - 0 = 1 (true)

variable "create_eip" {
  default = 1
}

resource "aws_eip" "example" {
  count = "${var.create_eip}"
  instance = "${aws_instance.example.id}"
}
resource "aws_route53_record" "example" {
  count = "${1 - var.create_eip}"
  zone_id = "A1B2CDEF3GH4IJ"
  name = "foo.example.com"
  type = "A"
  ttl = 300
  records = ["${aws_instance.example.public_ip}"]
}


#### Example 2 #######################################

variable "use_shell_script_user_data" {
  default = 1
}

#  phaze of createing 1 resource conditionally from `var.use_shell_script_user_data`
data "template_file" "user_data_shell" {
  count = "${var.use_shell_script_user_data}" # true
  template = <<-EOF
              #!/bin/bash
              run-microservice.sh
              EOF
}
data "template_file" "user_data_cloud" {
  count = "${1 - var.use_shell_script_user_data}" # false
  template = <<-EOF
              #cloud-config
              runcmd:
                - run-microservice.sh
              EOF
}

# when using `count`, resource will be a list
# now we are concatinating 2 lists, (this only one of them actually created) 
# we end up with `user_data` list of 1 item, then we extract the first item
resource "aws_instance" "example" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  user_data = "${element(concat(data.template_file.user_data_shell.*.rendered, data.template_file.user_data_cloud.*.rendered), 0)}"
  
  tags {
    Name = "${var.service_name}"
  }
}


