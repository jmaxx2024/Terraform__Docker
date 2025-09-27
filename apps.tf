# Primera aplicación Nginx
resource "docker_container" "app11" {
  name  = "app11"
  image = var.app_image

  networks_advanced {
    name = docker_network.app_red_aislade.name
  }
  networks_advanced {
    name = docker_network.monitor_red_aislade.name
  }
  networks_advanced {
    name = docker_network.persistence_red_aislade.name
  }

  ports {
    internal = 80
    external = 8081
  }

  # Crear index.html y arrancar nginx
  command = [
    "sh", "-c",
    "echo 'HELLO WORLD ESTA ES LA APP 1' > /usr/share/nginx/html/index.html && nginx -g 'daemon off;'"
  ]
}

# Segunda aplicación Nginx
resource "docker_container" "app22" {
  name  = "app22"
  image = var.app_image

  networks_advanced {
    name = docker_network.app_red_aislade.name
  }
  networks_advanced {
    name = docker_network.monitor_red_aislade.name
  }
  networks_advanced {
    name = docker_network.persistence_red_aislade.name
  }

  ports {
    internal = 80
    external = 8082
  }

  command = [
    "sh", "-c",
    "echo 'HELLO WORLD ESTA ES LA APP 2' > /usr/share/nginx/html/index.html && nginx -g 'daemon off;'"
  ]
}

# Tercera aplicación Nginx
resource "docker_container" "app33" {
  name  = "app33"
  image = var.app_image

  networks_advanced {
    name = docker_network.app_red_aislade.name
  }
  networks_advanced {
    name = docker_network.monitor_red_aislade.name
  }
  networks_advanced {
    name = docker_network.persistence_red_aislade.name
  }

  ports {
    internal = 80
    external = 8083
  }

  command = [
    "sh", "-c",
    "echo 'HELLO WORLD ESTA ES LA APP 3' > /usr/share/nginx/html/index.html && nginx -g 'daemon off;'"
  ]
}
