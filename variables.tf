variable project_name {
  type        = string
  default     = "Your project id"

}

variable region {
  type        = string
  default     = "europe-west1"
}


variable vpc_first_name {
  type        = string
  default     = "vpc-1"
}

variable vpc_second_name {
  type        = string
  default     = "vpc-2"
}

variable subnetwork_name_first {
  type        = string
  default     = "subnetwork-vpc-1"

}

variable subnetwork_ip_range_first {
  type        = string
  default     = "10.8.0.0/25"
}

variable region_subnetwork_first {
  type        = string
  default     = "europe-west1"
}


variable subnetwork_name_second {
  type        = string
  default     = "subnetwork-vpc-2"

}

variable subnetwork_ip_range_second {
  type        = string
  default     = "10.0.0.0/25"
}

variable region_subnetwork_second {
  type        = string
  default     = "us-west4"
}

variable vm_first_name {
  type        = string
  default     = "vm-1"
}

variable instance_machine_type {
  type        = string
  default     = "f1-micro"
  description = "description"
}

variable instance_image {
  type        = string
  default     = "debian-11"
  description = "description"
}

variable vm_first_zone {
  type        = string
  default     = "europe-west1-b"

}

variable vm_second_name {
  type        = string
  default     = "vm-2"
}



variable vm_second_zone {
  type        = string
  default     = "us-west4-b"
}

