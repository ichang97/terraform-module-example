terraform {
	required_providers {
		docker = {
			source = "kreuzwerker/docker"
			version = "~> 3.0.2"
		}
	}
}

resource "docker_image" "nginx" {
	name = "nginx:alpine"
	keep_locally = false
}

resource "docker_container" "mark-module-nginx" {
	image = docker_image.nginx.image_id
	name = var.container_name

	ports {
		internal = 80
		external = var.host_port
	}
}
