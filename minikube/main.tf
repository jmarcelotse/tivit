resource "null_resource" "install_minikube" {
  provisioner "local-exec" {
    command = "curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/"
  }
}

resource "null_resource" "start_minikube" {
  depends_on = [null_resource.install_minikube]

  provisioner "local-exec" {
    command = "minikube start"
  }
}
