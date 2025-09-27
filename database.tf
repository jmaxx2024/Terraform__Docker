# Contenedor de Redis
resource "docker_container" "redis123" {
  name  = "redis123"
  image = var.redis_image

  # Conexion a la red persistencia (persistence_net)
  networks_advanced {
    name = docker_network.persistence_red_aislade.name
  }

  ports {
    internal = 6379
    external = 6379
  }
}

# Contenedor de PostgreSQL
resource "docker_container" "postgres123" {
  name  = "postgres123"
  image = var.postgres_image
  
  # Variables de entorno para inicializar usuario, password y DB
  env = [
    "POSTGRES_USER=${var.postgres_user}",
    "POSTGRES_PASSWORD=${var.postgres_password}",
    "POSTGRES_DB=${var.postgres_db}"
  ]

  networks_advanced {
    name = docker_network.persistence_red_aislade.name
  }

  ports {
    internal = 5432
    external = 6000
  }
}
