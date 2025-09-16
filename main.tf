terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.6.2"
    }
  }
}

output "nginx_app1" {
  value = "http://localhost:8081"
}

output "nginx_app2" {
  value = "http://localhost:8082"
}

output "nginx_app3" {
  value = "http://localhost:8083"
}

output "grafana" {
  value = "http://localhost:3000 (user: admin, pass: admin)"
}

output "postgres" {
  value = "postgres://postgres:contrasena123456@localhost:5432"
}

output "redis" {
  value = "redis://localhost:6379"
}

provider "docker" {
}

# terraform init
# terraform workspace list
# terraform workspace new dev
# terraform plan
# terraform apply -y
# terraform destroy
