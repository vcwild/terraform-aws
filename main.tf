// instances
resource "aws_instance" "dev" {
    count = 3
    ami = var.amis["us-east-2"]
    instance_type = "t2.micro"
    key_name = var.key_name
    tags = {
        Name = "dev${count.index}"
    }

    vpc_security_group_ids = [ aws_security_group.access-ssh.id ]
}

resource "aws_instance" "dev4" {
    ami = var.amis["us-east-2"]
    instance_type = "t2.micro"
    key_name = var.key_name
    tags = {
        Name = "dev4"
    }

    vpc_security_group_ids = [ aws_security_group.access-ssh.id ]
    depends_on = [ aws_s3_bucket.dev4 ]
}

resource "aws_instance" "dev5" {
    ami = var.amis["us-east-2"]
    instance_type = "t2.micro"
    key_name = var.key_name
    tags = {
        Name = "dev5"
    }

    vpc_security_group_ids = [ aws_security_group.access-ssh.id ]
}

resource "aws_instance" "dev6" {
    provider = aws.us-east-1
    ami = var.amis["us-east-1"]
    instance_type = "t2.micro"
    key_name = var.key_name
    tags = {
        Name = "dev6"
    }

    vpc_security_group_ids = [ aws_security_group.access-ssh-us-east-1.id ]
    depends_on = [ aws_dynamodb_table.dynamodb-production ]
}

resource "aws_instance" "dev7" {
    provider = aws.us-east-1
    ami = var.amis["us-east-1"]
    instance_type = "t2.micro"
    key_name = var.key_name
    tags = {
        Name = "dev7"
    }

    vpc_security_group_ids = [ aws_security_group.access-ssh-us-east-1.id ]
}

// buckets
resource "aws_s3_bucket" "dev4" {
    bucket = "alomolieres-dev4"
    acl    = "private"

    tags = {
        Name = "alomolieres-dev4"
    }
}

// databases
resource "aws_dynamodb_table" "dynamodb-production" {
    provider = aws.us-east-1
    name           = "GameScores"
    billing_mode   = "PAY_PER_REQUEST"
    hash_key       = "UserId"
    range_key      = "GameTitle"

    attribute {
        name = "UserId"
        type = "S"
    }

    attribute {
        name = "GameTitle"
        type = "S"
    }
}
