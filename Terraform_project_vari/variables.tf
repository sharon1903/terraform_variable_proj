variable "Region"{
 default = "eu-west-2" 
 type= string
 description = "variable for region" 
}

variable "Vpc_cidr"{
 default = "10.0.0.0/16" 
 type= string
 description = "variable to change VPC cidr block" 
}

variable "Instance_tenancy" {
 default = "default" 
 type= string
 description = "variable for unstance tenancy" 
}

variable "enable_dns_hostnames" {
 default = true
 type= bool
 description = "variable to enable DNS hostname" 
}

variable "Prod-pub-sub1" {
 default = "10.0.5.0/24" 
 type= string
 description = "variable to change cidr block for public subnet 1" 
}

variable "Prod-pub-sub2" {
 default = "10.0.6.0/24"
 type= string
 description = "variable to change cidr block for public subnet 2" 
}

variable "Prod-priv-sub1" {
 default = "10.0.7.0/24" 
 type= string
 description = "variable to change cidr block for private subnet 1" 
}

variable "Prod-priv-sub2" { 
 default = "10.0.8.0/24" 
 type= string
 description = "variable to change cidr block for private subnet 2" 
}

variable "Instance_ami"{
 default = "ami-0ad97c80f2dfe623b" 
 type= string
 description = "variable for instance ami" 
}

variable "Instance_type" {
 default = "t2.micro" 
 type= string
 description = "variable for instance type" 
}

