terraform{
    backend "gcs" {
      bucket = "Your backet name"
      prefix  = "terraform_vpc_peering"
    }
}