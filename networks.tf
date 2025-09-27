
#   Definicion de redes de aislamiento   


# Red para las aplicaciones (app1, app2, app3)
resource "docker_network" "app_red_aislade" {
  name = var.app_red_aislade_name
}

# Red para las bases de datos (Redis y PostgreSQL)
resource "docker_network" "persistence_red_aislade" {
  name = var.persistence_red_aislade_name
}

# Red para el monitoreo (Grafana)
resource "docker_network" "monitor_red_aislade" {
  name = var.monitor_red_aislade_name
}