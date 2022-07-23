# using locals
resource "local_file" "myfile" {
  filename  = local.anshul
  content = local.content
}

locals {
  anshul= "local.txt"
  content= "hello my name is ram" 
}
#by using random generate random id
resource "local_file" "myfile1" {
  filename  = local.anshul2
  content = "${random_id.content.hex}"
}
locals {

  anshul2= "random_id.txt"

  content1= "hello my name is anshul" 
 
}
 resource "random_id" "content" {
  byte_length = 6
}
 #using string
 resource "local_file" "myfile3" {
  filename  = "string.txt"
  content = var.anshul3
}

variable "anshul3" {
  type = string
  description = "pass the value of content"
  default = "hey i am variable"
}
 #using number
  resource "local_file" "myfile4" {
  filename  = "number.txt"
  content = var.anshul4
 }
 variable "anshul4" {
  type = number
  description = "pass the value of content"
  default = 456
}
#using list
 resource "local_file" "myfile5" {
  filename  = "list.txt"
  content = var.anshul5[1]
 }
variable "anshul5" {
  type = list(any)
  description = "pass the value of content"
  default = ["986","content list"]
}
#using map
 resource "local_file" "myfile6" {
  filename  = "map.txt"
  content = var.anshul6["pass-content"]
 }
variable "anshul6" {
  type = map(any)
  description = "pass the value of content"
  default = {
    "key1"="value1"
    "key2"="value2"
    "key3"="value3"
    "pass-content"="my content"
  }
}
#using object
 resource "local_file" "myfile7" {
  filename  = "object.txt"
  content = var.anshul7["content"]
 }
variable "anshul7" {
    type = object({
    filename=string,
    content=number    
    })
    description = "pass the value of content"
    default = {
      content = 1999
      filename = "saluja"
    }
  
}

#passing the content through terraform.tfvars
resource "local_file" "myfile8" {
  filename = var.anshulkumar
  content = var.content
  
}


# output block
resource "local_file" "myfile9" {
  filename  = var.anshulkumar
  content = var.content
}
output "output_name" {
  value = local_file.myfile9.content
  
}