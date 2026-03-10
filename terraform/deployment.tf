resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "terraform-nginx"
    labels = {
      App = "nginx"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        App = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          App = "nginx"
        }
      }

      spec {
        container {
          image = "yourdockerhub/devops-nginx:latest"
          name  = "nginx"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}