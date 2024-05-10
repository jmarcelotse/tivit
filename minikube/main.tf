resource "null_resource" "install_minikube" {
  provisioner "local-exec" {
    command = "curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/ && minikube config set driver docker"
    environment = {
      MINIKUBE_WANT_REPORTERRORPROMPT = "false"
    }
  }

  # Prevent Docker driver usage with root privileges
  provisioner "local-exec" {
    command     = "minikube status"
    interpreter = ["bash", "-c"]
    environment = {
      MINIKUBE_WANT_REPORTERRORPROMPT = "false"
    }

    # Only execute if Minikube has been installed
    when = "destroy"
  }
}

resource "null_resource" "start_minikube" {
  depends_on = [null_resource.install_minikube]

  provisioner "local-exec" {
    command = "minikube start --force"
    environment = {
      MINIKUBE_WANT_REPORTERRORPROMPT = "false"
    }
  }
}
