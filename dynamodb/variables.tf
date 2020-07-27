variable "aws_region" {
  default     = "eu-west-1"
}

variable "read_capacity"{
    default = 5
}

variable "write_capacity"{
    default =   5
}

variable "aws_region_main" {
  default     = "eu-west-1" //"us-east-2"
}

variable "billing_mode"{
    default = "PAY_PER_REQUEST"  // default is PROVISIONED and PAY_PER_REQUEST
} 

 variable "dynamoDbname"{
      default = "notesireland"
  }

  variable "hash_key"{
      default   = "noteId"
  }

  variable "type"{
      default="S"
  }
