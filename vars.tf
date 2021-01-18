variable "amis" {
  type = map(string)
  default = {
    "us-east-1" = "ami-0be2609ba883822ec"
    "us-east-2" = "ami-0dd9f0e7df0f0a138"
  }
}

variable "cdirs_remote_access" {
  type = list(string)
  default = [ "179.187.66.199/32" ]
}

variable "key_name" {
  default = "terraform-aws"  
}