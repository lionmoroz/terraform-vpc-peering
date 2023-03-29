resource "google_compute_network_peering" "peering1" {
  name         = "peering1"
  network      = google_compute_network.vpc-first.self_link
  peer_network = google_compute_network.vpc-second.self_link
}

resource "google_compute_network_peering" "peering2" {
  name         = "peering2"
  network      = google_compute_network.vpc-second.self_link
  peer_network = google_compute_network.vpc-first.self_link
}

resource "google_compute_network" "vpc-first" {
  name                    = "${var.vpc_first_name}"
  auto_create_subnetworks = "false"
}

resource "google_compute_network" "vpc-second" {
  name                    = "${var.vpc_second_name}"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "subnetwork-vpc-first" {
    name          = "${var.subnetwork_name_first}"
    network = google_compute_network.vpc-first.self_link
    ip_cidr_range = "${var.subnetwork_ip_range_first}"
    region        = "${var.region_subnetwork_first}"
}


resource "google_compute_subnetwork" "subnetwork-vpc-second" {
  name          = "${var.subnetwork_name_second}"
  network       = google_compute_network.vpc-second.self_link
  ip_cidr_range = "${var.subnetwork_ip_range_second}"
  region        = "${var.region_subnetwork_second}"
}


resource "google_compute_firewall" "icmp-vpc-first" {
  name    = "${var.vpc_first_name}-firewall-icmp"
  network = "${google_compute_network.vpc-first.name}"

  allow {
    protocol = "icmp"
  }

  source_ranges = ["${google_compute_subnetwork.subnetwork-vpc-first.ip_cidr_range}", "${google_compute_subnetwork.subnetwork-vpc-second.ip_cidr_range}"]
}

resource "google_compute_firewall" "icmp-vpc-second" {
  name    = "${var.vpc_second_name}-firewall-icmp"
  network = "${google_compute_network.vpc-second.name}"

  allow {
    protocol = "icmp"
  }

  source_ranges = ["${google_compute_subnetwork.subnetwork-vpc-second.ip_cidr_range}","${google_compute_subnetwork.subnetwork-vpc-first.ip_cidr_range}"]
}


resource "google_compute_firewall" "ssh-connection" {
  name        = "${var.vpc_first_name}-ssh"
  network     = google_compute_network.vpc-first.self_link



  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["${var.vpc_first_name}-ssh"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "ssh-connection-2" {
  name        = "${var.vpc_second_name}-ssh"
  network     = google_compute_network.vpc-second.self_link



  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["${var.vpc_second_name}-ssh"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}



resource "google_compute_instance" "vm-1"{
    name = "${var.vm_first_name}"
    machine_type = "${var.instance_machine_type}"
    zone         = "${var.vm_first_zone}"

    tags = ["${var.vpc_first_name}-ssh"]

    boot_disk {
        initialize_params {
        image = "${var.instance_image}"
        }
    }

    network_interface {
        network = google_compute_network.vpc-first.self_link
        subnetwork = google_compute_subnetwork.subnetwork-vpc-first.self_link
    }
}

resource "google_compute_instance" "vm-2"{
    name = "${var.vm_second_name}"
    machine_type = "${var.instance_machine_type}"
    zone         = "${var.vm_second_zone}"

    tags = ["${var.vpc_second_name}-ssh"]

    boot_disk {
        initialize_params {
        image = "${var.instance_image}"
        }
    }

    network_interface {
        network = google_compute_network.vpc-second.self_link
        subnetwork = google_compute_subnetwork.subnetwork-vpc-second.self_link
    }
}