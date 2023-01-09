template {
  source = "/etc/consul-template/templates/nginx.conf"
  destination = "/etc/nginx/conf.d/default.conf"

  # To avoid conflicts with salt's jinja templating
  left_delimiter  = "[["
  right_delimiter = "]]"


  command = "bash -c 'systemctl reload-or-restart nginx || true'"
  command_timeout = "30s"


  error_on_missing_key = true

  perms = 0600

  backup = true

  wait {
    min = "2s"
    max = "10s"
  }
}
