# Contenedor de Grafana expuesto en el puerto 3000
resource "docker_container" "grafana123" {
  name  = "grafana123"
  image = var.grafana_image

  # Conexion a la red de monitoreo (monitor_net)
  networks_advanced {
    name = docker_network.monitor_red_aislade.name
  }

  ports {
    internal = 3000
    external = 8085
  }
}