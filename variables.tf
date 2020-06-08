variable "org_configuration" {
  description = "Defines a list of Organzation Configuration parameters"
  type        = map(string)
}

variable "vcs_configuration" {
  description = "Defines a list of Oauth Client Configuration parameters"
  type        = list(map(string))
}

variable "vcs_enabled" {
    description = "Defines if the organization will use VCS"
    type = bool
    default = true
}