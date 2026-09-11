terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"  # <--- AGGIUNGI QUESTA RIGA ESATTA
    }
  }
}

provider "aws" {
  region  = "us-west-2"
}
