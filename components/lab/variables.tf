/*
 * VNet Cidr address space ranges that can be used
 * In the case some else is running the labs as well
-----
1	10.10.0.0/25
2	10.10.0.128/25
3	10.10.1.0/25
4	10.10.1.128/25
5	10.10.2.0/25
6	10.10.2.128/25
7	10.10.3.0/25
8	10.10.3.128/25
9	10.10.4.0/25
10	10.10.4.128/25
11	10.10.5.0/25
12	10.10.5.128/25
13	10.10.6.0/25
14	10.10.6.128/25
15	10.10.7.0/25
16	10.10.7.128/25
-----
*/

variable "location" {
  default = "uksouth"
}

variable "address_space" {
  default = "10.10.0.128/25"
}

variable "environment" {
  default = "sandbox"
}
variable "product" {
  default = "sds-platform"
}
variable "builtFrom" {
  default = "labs"
}

variable "env" {
  default = "sbox"
}

variable "hub_sbox_subscription_id" {
  default = "ea3a8c1e-af9d-4108-bc86-a7e2d267f49c"
}

variable "subscription_id" {
  default = "a8140a9e-f1b0-481f-a4de-09e2ee23f7ab"
}


// Add Key Vault Variables
variable "key_type" {
  description = "The JsonWebKeyType of the key to be created."
  default     = "RSA"
  type        = string
  validation {
    condition     = contains(["EC", "EC-HSM", "RSA", "RSA-HSM"], var.key_type)
    error_message = "The key_type must be one of the following: EC, EC-HSM, RSA, RSA-HSM."
  }
}

variable "key_ops" {
  type        = list(string)
  description = "The permitted JSON web key operations of the key to be created."
  default     = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]
}

variable "key_size" {
  type        = number
  description = "The size in bits of the key to be created."
  default     = 2048
}

variable "key_name" {
  type        = string
  description = "The name of the key to be created. The value will be randomly generated if blank."
  default     = ""
}
