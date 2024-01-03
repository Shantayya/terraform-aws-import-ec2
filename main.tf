# resource "aws_instance" "web" {
#     ami = "ami-0a0f1259dd1c90938"
#     instance_type = "t2.micro"
# }

import {
  id = "i-0a4bdd3f04077a85d"
  to = aws_instance.web
}