resource "google_compute_instance" "vm_instance" {
  name         = "host-vm"
  machine_type = "n1-standard-1"
  zone          = "europe-west2-c"
  #metadata_startup_script="${file("installationScript.bash")}"

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
  provisioner "file" {
    source      = "./installationScript.sh"
    destination = "/home/tonytruran/installationScript.sh"
    connection {
    type     = "ssh"
    user     = "tonytruran"
    private_key="${file("./private/id_rsa")}"
  }
  }
  provisioner "file" {
    source      = "./startupScript.sh"
    destination = "/home/tonytruran/pokedex/npmScript.sh"
    connection {
    type     = "ssh"
    user     = "tonytruran"
    private_key="${file("./private/id_rsa")}"
  }
  }
}