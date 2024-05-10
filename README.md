***Kubernetes Environment Setup***

Este repositório contém os arquivos necessários para provisionar um ambiente Kubernetes local usando Kind ou Minikube, implementado com Terraform. Após a execução, você poderá acessar um "Hello World" usando Nginx ou Traefik/Whoami.

**Pré-requisitos**
Antes de começar, certifique-se de ter o seguinte instalado em sua máquina local:

***Terraform***
***Kind ou Minikube***
***kubectl***

**Este README fornece instruções claras sobre como executar o projeto e acessar o "Hello World" usando Nginx ou Traefik/Whoami. Se precisar de mais assistência, não hesite em entrar em contato!**

**1 - Clone este repositório:**

    git clone https://github.com/jmarcelotse/tivit.git

        cd repositorio

**2 - Escolha o ambiente Kubernetes que deseja provisionar:**

    Provisionar com Kind:
        Execute os seguintes comandos:
        cd kind
        terraform init
        terraform plan
        terraform apply

    Provisionar com Minikube:
        Execute os seguintes comandos:
        cd kind
        terraform init
        terraform plan
        terraform apply

**3 - Aguarde a conclusão da execução do Terraform.**

**4 - Após a conclusão, verifique se o ambiente Kubernetes está pronto:**

**Kind**

Execute: ***kubectl get nodes*** para ver os nós do cluster.

**Minikube**

Execute ***minikube status*** para verificar o status do cluster.

**5 - Acesse o "Hello World":**

    Nginx:
    Kind:
        Execute

        kubectl apply -f deployment.yaml -f configmap.yaml para implantar o serviço Nginx.

    Minikube:
        Execute

        kubectl apply -f deployment.yaml -f configmap.yaml para implantar o serviço Nginx.

    Acesse o serviço Nginx em http://192.168.49.2:31912.

    31912 Seria o a porta do Node

    Traefik/Whoami:

    Kind:

    Execute kubectl apply -f traefik-whoami.yaml para implantar o serviço Traefik e Whoami.

    Minikube:

    Execute kubectl apply -f traefik-whoami.yaml para implantar o serviço Traefik e Whoami.


    Acesse o Whoami através do Traefik em http://localhost:8080/whoami.

**6 - Quando terminar, você pode limpar os recursos criados:**
    terraform destroy

Evidências
Na pasta evidencias, você pode encontrar capturas de tela do ambiente Kubernetes implantado e do acesso ao "Hello World".
