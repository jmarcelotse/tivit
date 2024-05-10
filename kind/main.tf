variable "kind_cluster_name" {
  default = "tivit-kind-cluster"
}

variable "kind_version" {
  default = "v0.11.1"
}

terraform {
  required_providers {
    external = {
      source  = "hashicorp/external"
      version = "~> 2.0"
    }
  }
}

resource "null_resource" "install_kind" {
  provisioner "local-exec" {
    command = "curl -Lo ./kind https://kind.sigs.k8s.io/dl/${var.kind_version}/kind-linux-amd64 && chmod +x ./kind && sudo mv ./kind /usr/local/bin/"
  }
}

resource "null_resource" "create_cluster" {
  depends_on = [null_resource.install_kind]

  provisioner "local-exec" {
    command = "kind create cluster --name=${var.kind_cluster_name}"
  }
}
