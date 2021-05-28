
variable "instance_count" {
  default = 1
}

variable "instance_type" {
  default = "m5.large.elasticsearch"
}

variable "dedicated_master_enabled" {
  default = true
}

variable "dedicated_master_count" {
  default = 1 
}

variable "dedicated_master_type" {
  default = "m5.large.elasticsearch"
}

variable "zone_awareness_enabled" {
  default = false
}

variable "ebs_enabled" {
  default = true
}

variable "ebs_volume_size" {
  default = 100
}

variable "encrypt_at_rest_enabled" {
  default = true
}
