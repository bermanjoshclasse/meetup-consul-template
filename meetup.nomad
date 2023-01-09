variable "docker_image_tag" {
  description = "The tag of the docker image to deploy."
  type        = string
}

job "meetup" {
  datacenters = ["meetup-dc"]

  group "meetup" {
    network {
      port "meetup" {
        to = 8000
      }
    }

    task "meetup" {
      driver = "docker"

      resources {
        cpu  = 2000
        memory = 2048
      }

      config {
        image   = "ghcr.io/bermanjoshclasse/meetup-consul-template:${var.docker_image_tag}"
        ports   = ["python"]
      }

      service {
        name = "meetup"
        port = "meetup"
      }
    }
  }
}
