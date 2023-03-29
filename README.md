# terraform-vpc-peering

Terraform VPC Peering on Google Cloud Platform

This project uses Terraform to create a VPC peering connection between two Virtual Private Cloud (VPC) networks on Google Cloud Platform (GCP). The peering connection allows traffic to flow securely between the two VPC networks.

Prerequisites
Before using this Terraform module, you need to have the following:

- A GCP account with the necessary permissions to create VPC networks and peering connections.
- Terraform installed on your local machine.

Usage
1. Clone the repository to your local machine: git clone https://github.com/lionmoroz/terraform-vpc-peering
2. Navigate to the cloned directory: cd terraform-vpc-peering
3. Modify the variables.tf file to match your desired configuration. You will need to specify the names of the two VPC networks you want to peer, along with any other desired options.
4. Initialize the Terraform modules: terraform init
5. Preview the changes Terraform will make: terraform plan
6. Apply the changes to create the VPC peering connection: terraform apply


Contributing
Contributions are welcome! Please feel free to submit a pull request with any improvements or bug fixes.