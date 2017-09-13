variable "domain" {
  description = "Top-level domain to be redirected"
  default = ""
}

variable "zone_id" {
  description = "Route 53 Zone ID for domain to be redirected"
  default = ""
}

variable "redirect" {
  description = "Destination of redirect"
  default = ""
}
